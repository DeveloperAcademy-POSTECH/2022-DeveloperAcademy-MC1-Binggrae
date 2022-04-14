import SwiftUI

struct FireView : UIViewRepresentable {
    
    @Binding var isPlaying: Bool
    
    func makeUIView(context: Context) -> some UIView {
        let view = UIView()
        view.backgroundColor = .clear
        let fireEmitter = CAEmitterLayer()
        fireEmitter.emitterPosition = CGPoint(x: 200, y: 400)
        fireEmitter.emitterSize = CGSize(width: 160, height: 100);
        fireEmitter.renderMode = CAEmitterLayerRenderMode.additive;
        
        fireEmitter.emitterShape = .line
        fireEmitter.emitterCells = [createFireCell()]
        
        view.layer.addSublayer(fireEmitter)
        return view
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        uiView.isHidden = !isPlaying
    }
    
    func createFireCell() -> CAEmitterCell {
        let fire = CAEmitterCell();
        fire.alphaSpeed = -0.3
        fire.birthRate = 600;
        fire.lifetime = 60.0;
        fire.lifetimeRange = 0.5
        fire.color = UIColor.init(displayP3Red: 0.8, green: 0.4, blue: 0.2, alpha: 0.6).cgColor
        fire.contents = UIImage(named: "fire")?.cgImage
        fire.emissionLongitude = CGFloat(Double.pi);
        fire.velocity = 80;
        fire.velocityRange = 5;
        fire.emissionRange = 0.5;
        fire.yAcceleration = -200;
        fire.scaleSpeed = 0.3;
        
        return fire
    }
}
