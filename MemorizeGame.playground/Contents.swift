import SwiftUI
import PlaygroundSupport

struct ContentView: View {
    var emojis = ["🚲", "🚂", "🚁", "🚜", "🏎", "🚑", "🚓", "🚒", "✈️", "🚀", "⛵️", "🛸", "🛶", "🚌", "🏍", "🛺", "🚠", "🛵", "🚗", "🚚", "🚇", "🛻", "🚝"]
    var emojiCount = 6
    
    var body: some View {
        HStack {
            ForEach(emojis[0..<emojiCount], id: \.self) { emoji in
                CardView(content: emoji)
            }
            
        }
        .padding(.horizontal)
        .foregroundColor(.orange)
    }
}

struct CardView: View {
    var content: String
    @State var isFaceUp = true
    
    var body: some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 20)
            if isFaceUp {
                shape.fill()
                    .foregroundColor(.white)
                shape.stroke(lineWidth: 3)
                Text(content)
                    .font(.largeTitle)
            } else {
                shape.fill()
            }
        }
        .onTapGesture {
            isFaceUp = !isFaceUp
        }
    }
}












//: Here is Test Area, Don't Touch!
//: ---
// MARK: - PreView Area, DON'T Touch!
let view = ContentView()
PlaygroundPage.current.setLiveView(view)
print(PlaygroundPage.current.liveView.debugDescription.description)
