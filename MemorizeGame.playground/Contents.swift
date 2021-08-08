import SwiftUI
import PlaygroundSupport

struct ContentView: View {
    var viewModel: EmojiMemoryGame
    @State var emojiCount = 6
    
    var body: some View {
        VStack {
            ScrollView {
                
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 80))]) {
                    ForEach(emojis[0..<emojiCount], id: \.self) { emoji in
                        CardView(content: emoji)
                            .aspectRatio(2/3, contentMode: .fit)
                    }
                }
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
                shape.strokeBorder(lineWidth: 3)
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
let game = Emoji
let view = ContentView(viewModel: game)
PlaygroundPage.current.setLiveView(view)
print(PlaygroundPage.current.liveView.debugDescription.description)
