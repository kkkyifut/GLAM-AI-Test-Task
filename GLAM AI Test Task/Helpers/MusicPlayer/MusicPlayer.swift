import Foundation
import AVFoundation

final class MusicPlayer {
    static let shared = MusicPlayer()
    private var audioPlayerTemplate: AVAudioPlayer?
    private let soundBackgroundTemplate = "music"
    private let soundTypeAAC = "aac"
    
    var currentMusicDuration: Float? {
        return Float(audioPlayerTemplate?.duration ?? 0)
    }

    
    func startTemplateMusic() {
        if let bundle = Bundle.main.path(forResource: soundBackgroundTemplate, ofType: soundTypeAAC) {
            let templateMusic = NSURL(fileURLWithPath: bundle)
            do {
                audioPlayerTemplate = try AVAudioPlayer(contentsOf: templateMusic as URL)
                guard let audioPlayerTemplate = audioPlayerTemplate else { return }
                audioPlayerTemplate.numberOfLoops = 0
                audioPlayerTemplate.prepareToPlay()
                audioPlayerTemplate.play()
            } catch {
                print("Error: ", error)
            }
        }
    }
    
    func stopTemplateMusic() {
        guard let audioPlayerTemplate = audioPlayerTemplate else { return }
        audioPlayerTemplate.stop()
    }
}
