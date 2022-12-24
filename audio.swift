import AVFoundation

let audioFileURL = URL(fileURLWithPath: "algo.mp3")

do {
    let audioPlayer = try AVAudioPlayer(contentsOf: audioFileURL)
    audioPlayer.play()
} catch {
    print("Error playing audio file: \(error)")
}
