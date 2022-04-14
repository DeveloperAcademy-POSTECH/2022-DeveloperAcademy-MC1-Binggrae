import Foundation
import AVKit
import UIKit

final class AudioManager: ObservableObject {
    
    var player: AVAudioPlayer?
    var paused: Bool = false
    
    init(name:String) {
        guard let filePath = Bundle.main.url(forResource: name, withExtension: "mp3") else {
            fatalError("Unfounded file")
        }
        do {
            player = try AVAudioPlayer(contentsOf: filePath)
            player?.prepareToPlay()
            var audioSession = AVAudioSession.sharedInstance()
            do {
                try audioSession.setCategory(.playback, mode: .default, options: [.mixWithOthers, .allowAirPlay])
                try audioSession.setActive(true)
                
            } catch { print(error) }
        } catch {
            print("Fail to initialize player",error)
        }
    }
    
    func play(){
        player?.numberOfLoops = 10
        player?.play()
    }
    
    func stop() {
        player?.stop()
    }
    
}
