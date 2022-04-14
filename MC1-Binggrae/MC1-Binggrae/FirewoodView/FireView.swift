import SwiftUI

struct FireView : UIViewRepresentable {
    
    @Binding var isPlaying: Bool
    @Binding var flameColor : String
    
    func makeUIView(context: Context) -> some UIView {
        let view = UIView()
        view.backgroundColor = .clear
        let fireEmitter = CAEmitterLayer()
        fireEmitter.emitterPosition = CGPoint(x: 200, y: 390)
        fireEmitter.emitterSize = CGSize(width: 120, height: 60);
        fireEmitter.renderMode = CAEmitterLayerRenderMode.additive;
        
        fireEmitter.emitterShape = .circle
        fireEmitter.emitterCells = [createFireCell(flameColor: flameColor)]
        
        view.layer.addSublayer(fireEmitter)
        return view
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        uiView.isHidden = !isPlaying
    }
    
    func createFireCell(flameColor:String) -> CAEmitterCell {
        let fire = CAEmitterCell();
        fire.alphaSpeed = -0.3
        fire.birthRate = 600;
        fire.lifetime = 300;
        
        switch flameColor {
        case "blue" :
            fire.blueRange = 100
            fire.blueSpeed = 0.8
        case "purple" :
            fire.redRange = 10
            fire.redRange = 0.8
//            fire.greenRange = 10
        default :
            break
        }
        fire.lifetimeRange = 0.5
        fire.color = UIColor.flameColor(flameColor).cgColor
        fire.contents = UIImage(named: "fire")?.cgImage
        fire.emissionLongitude = CGFloat(2);
        fire.velocity = 40;
        fire.velocityRange = 5;
        fire.emissionRange = 1;
        fire.yAcceleration = -200;
        fire.scaleSpeed = 0.3;
        
        return fire
    }
}



