// View Area

import SwiftUI
import PlaygroundSupport

private let game = EmojiMemoryGame()

struct EmojiMemoryGameView: View {
    @ObservedObject var game: EmojiMemoryGame
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 80))]) {
                ForEach(game.cards) { card in
                    CardView(card: card)
                        .aspectRatio(2/3, contentMode: .fit)
                        .onTapGesture {
                            game.choose(card)
                        }
                }
            }
        }
        .padding(.horizontal)
        .foregroundColor(.orange)
    }
}

struct CardView: View {
    let card: MemoryGame<String>.Card
    
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                let shape = RoundedRectangle(cornerRadius: DrawingConstants.cornderRadius)
                if card.isFaceUp {
                    shape.fill()
                        .foregroundColor(.white)
                    shape.strokeBorder(lineWidth: DrawingConstants.lineWidth)
                    Text(card.content)
                        .font(.system(size: min(geometry.size.width, geometry.size.height) * DrawingConstants.fontScale))
                } else if card.isMatched {
                    shape.opacity(0)
                } else {
                    shape.fill()
                }
            }
        }
    }
    private struct DrawingConstants {
        static let cornderRadius: CGFloat = 20
        static let lineWidth: CGFloat = 3
        static let fontScale: CFFloat = 0.75
    }
    
}













//: Here is Test Area, Don't Touch!
//: ---
// MARK: - PreView Area, DON'T Touch!
let view = EmojiMemoryGameView(game: game)
PlaygroundPage.current.setLiveView(view)
print(PlaygroundPage.current.liveView.debugDescription.description)
