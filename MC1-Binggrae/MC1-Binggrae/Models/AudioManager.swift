import Foundation
import AVKit
import UIKit

final class AudioManager: ObservableObject {
    
    var player: AVAudioPlayer?
    var paused: Bool = false
    
    init() {
        guard let filePath = Bundle.main.url(forResource: "firewood_asmr", withExtension: "mp3") else {
            fatalError("Unfounded file")
        }
        do {
            player = try AVAudioPlayer(contentsOf: filePath)
        } catch {
            print("Fail to initialize player",error)
        }
    }
    func play(){
        player?.play()
    }
    
    func stop() {
        player?.stop()
    }
    
}
