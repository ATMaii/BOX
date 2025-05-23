import SwiftUI
import AVFoundation

struct ContentView: View {
    @State private var isLightOn = false
    @State private var pullOffset: CGFloat = 0
    @State private var player: AVAudioPlayer?

    var body: some View {
        ZStack {
            backgroundColor
                .ignoresSafeArea()

            VStack {
                Spacer().frame(height: 100)

                Image(systemName: "lightbulb.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100)
                    .foregroundColor(isLightOn ? .yellow : .gray)
                    .shadow(color: isLightOn ? .yellow.opacity(0.5) : .clear, radius: 30)

                Spacer()

                Text("Pull to Toggle Light")
                    .font(.headline)
                    .foregroundColor(.gray)

                pullDownHandle
                    .padding(.bottom, 100)
            }
        }
    }

    var backgroundColor: Color {
        isLightOn ? .white : .black
    }

    var pullDownHandle: some View {
        RoundedRectangle(cornerRadius: 10)
            .fill(Color.gray)
            .frame(width: 80, height: 20)
            .gesture(
                DragGesture()
                    .onChanged { value in
                        pullOffset = value.translation.height
                    }
                    .onEnded { value in
                        if pullOffset > 40 {
                            isLightOn.toggle()
                            playClickSound()
                        }
                        pullOffset = 0
                    }
            )
            .offset(y: pullOffset)
    }

    func playClickSound() {
        guard let url = Bundle.main.url(forResource: "click", withExtension: "mp3") else {
            print("Sound file not found.")
            return
        }
        do {
            player = try AVAudioPlayer(contentsOf: url)
            player?.play()
        } catch {
            print("Failed to play sound:

if pullOffset > 40 {
    isLightOn.toggle()
    playClickSound()
}