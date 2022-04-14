//
//  ContentView.swift
//  MC1
//
//  Created by jiin on 2022/04/08.
//
//
//in download - mc1

import UIKit
import GameplayKit
import SpriteKit
import SwiftUI

struct physics{
    static let match : UInt32 = 0b1
    static let box : UInt32 = 0b10
}

class GameScene: SKScene, SKPhysicsContactDelegate, ObservableObject {
    let soundEff = SKAction.playSoundFileNamed("matchsound", waitForCompletion: false)
    var isFired: Bool = false
    @Published var touchButton: Bool = false
    
    
    private var currentNode: SKNode?
    var fireParticle : SKEmitterNode = SKEmitterNode()
    var message = SKLabelNode(fontNamed: "Noto Sans CJK KR")
    var messageBackground : SKShapeNode?
    // var messageBackground = SKSpriteNode()
    var button = SKLabelNode(fontNamed: "Noto Sans CJK KR")
    
    override func didMove(to view: SKView) {
        self.physicsWorld.contactDelegate = self // 충돌 감지 scene을 이 scene으로 설정
        backgroundColor = .black
        
        message.text = "성냥을 그어 불을 붙여 보세요"
        message.zPosition = 6
        message.position = CGPoint(x: self.size.width / 2 , y: 60)
        message.fontSize = 14
        self.addChild(message)
        
        messageBackground = SKShapeNode(rect: CGRect(x: self.size.width / 2 - 125, y: 60 - message.frame.size.height / 2 , width: 250, height: 25), cornerRadius: 12.5)
        messageBackground?.zPosition = 5
        messageBackground?.fillColor = UIColor(rgb: 0x141414)
        messageBackground?.lineWidth = 0.0
        self.addChild(messageBackground!)
        
        button.text = "다음으로"
        button.name = "button"
        button.zPosition = 4
        button.position = CGPoint(x: self.size.width / 2, y: 60)
        button.fontSize = 18
        
        self.addChild(button)
        
        let match = SKSpriteNode(imageNamed: "match")
        match.position = CGPoint(x: self.size.width * 3 / 5, y:self.size.height * 5 / 16)
        match.zPosition = 3 //숫자 클수록 위에
        match.name = "match"
        match.physicsBody = SKPhysicsBody(texture: match.texture!, size: match.texture!.size())
        match.physicsBody?.categoryBitMask = physics.match
        match.physicsBody?.contactTestBitMask = physics.box //2 객체랑 접촉했는지를 판정
        match.physicsBody?.affectedByGravity = false
        match.physicsBody?.isDynamic = false
        match.physicsBody?.allowsRotation = false
        match.physicsBody?.usesPreciseCollisionDetection = true
        self.addChild(match)
        
        let box = SKSpriteNode(imageNamed: "box")
        box.position = CGPoint(x:self.size.width / 8 + 100, y: self.size.height * 4/7 - 25)
        box.zPosition = 1
        box.alpha = 0
        box.name = "box"
        box.physicsBody = SKPhysicsBody(texture: box.texture!, size: box.texture!.size())
        box.physicsBody?.categoryBitMask = physics.box
        box.physicsBody?.contactTestBitMask = physics.match
        box.physicsBody?.affectedByGravity = false
        box.physicsBody?.isDynamic = true
        self.addChild(box)
        
        let matchbox = SKSpriteNode(imageNamed: "matchbox")
        matchbox.position = CGPoint(x: self.size.width / 8, y: self.size.height * 4/7)
        matchbox.zPosition = 2
        matchbox.name = "matchbox"
        self.addChild(matchbox)
        
        fireParticle = SKEmitterNode(fileNamed: "matchfire")!
        fireParticle.zPosition = 4
    }
    
    func didBegin(_ contact: SKPhysicsContact) {
        
        var firstBody: SKPhysicsBody
        var secondBody: SKPhysicsBody
        if contact.bodyA.categoryBitMask < contact.bodyB.categoryBitMask {
            firstBody = contact.bodyA
            secondBody = contact.bodyB
        } else {
            firstBody = contact.bodyB
            secondBody = contact.bodyA
        }
        
        
        if ((firstBody.categoryBitMask & physics.match != 0) &&
            (secondBody.categoryBitMask & physics.box != 0) && isFired != true) {
            run(SKAction.sequence([soundEff]))
            self.addChild(fireParticle)
            isFired = true
        }
        if isFired{
            message.removeFromParent()
            messageBackground?.removeFromParent()
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) { //첫인자: touch begin정보
        if let touch = touches.first {
            let location = touch.location(in: self)
            
            let touchedNodes = self.nodes(at: location)
            for node in touchedNodes.reversed(){
                if node.name == "match" {
                    self.currentNode = node
                }
            }
        }
        for touch in touches.reversed() {
            let location = touch.location(in: self)
            let touchedNode = atPoint(location)
            if touchedNode.name == "button" {
                sayHello()
            }
            else if touchedNode.name == "match"{
                self.currentNode = touchedNode
            }
        }
    }
    func sayHello(){
        print("Hello")
        touchButton = true
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.currentNode = nil
        
    }
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.currentNode = nil
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        if let touch = touches.first, let node = self.currentNode {
            let touchLocation = touch.location(in: self)
            node.position.x = touchLocation.x - 58
            node.position.y = touchLocation.y
            if isFired {
                fireParticle.position.x = node.position.x - 18
                fireParticle.position.y = node.position.y + 65
                
            }
        }
    }
}


struct MatchView: View {
    @ObservedObject var scene: GameScene = GameScene()
    @Binding var firewoodData: Firewood?
    
    init(firewoodData: Binding<Firewood?>){
        self._firewoodData = firewoodData
        scene.scaleMode = .resizeFill
    }
    
    var body: some View {
        ZStack{
            SpriteView(scene:scene)
                .fullScreenCover(isPresented: $scene.touchButton) {
                    FirewoodView(
                        asmrName:(firewoodData?.tree.asmrName)!,
                        flameColor:(firewoodData?.tree.flameColor)!,
                        imageName: (firewoodData?.tree.name)!,
                        remainedTime:(firewoodData?.tree.time)!
                    )
                        .transition(.opacity)
                        .opacity(scene.isFired ? 1 : 0)
                }
        }.ignoresSafeArea()
    }
}


//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        MatchView()
//    }
//}
