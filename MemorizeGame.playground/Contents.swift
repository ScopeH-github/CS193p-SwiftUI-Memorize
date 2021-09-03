// View Area

import SwiftUI
import PlaygroundSupport

private let game = EmojiMemoryGame()

struct EmojiMemoryGameView: View {
    @ObservedObject var game: EmojiMemoryGame
    
    var body: some View {
        AspectVGrid(items: game.cards, aspectRatio: 2/3) { card in
            if card.isMatched && !card.isFaceUp {
                Rectangle().opacity(0)
            } else {
                CardView(card: card)
                    .padding(4)
                    .onTapGesture {
                        game.choose(card)
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
                Pie(startAngle: Angle(degrees: 0-90), endAngle: Angle(degrees: 110-90))
                    .padding(5).opacity(0.6)
                Text(card.content).font(font(in: geometry.size))
                    .rotationEffect(Angle.degrees(card.isMatched ? 360 : 0))
                    .animation(Animation.linear(duration: 1).repeatForever(autoreverses: false))
                    .font(Font.system(size: 32))
            }
            .cardify(isFaceUp: card.isFaceUp)
        }
    }
    
    private func font(in size: CGSize) -> Font {
        Font.system(size: min(size.width, size.height) * DrawingConstants.fontScale)
    }
    
    private struct DrawingConstants {
        static let fontScale: CGFloat = 0.7
    }
    
}













//: Here is Test Area, Don't Touch!
//: ---
// MARK: - PreView Area, DON'T Touch!
let view = EmojiMemoryGameView(game: game)
//  game.choose(game.cards.first!)
PlaygroundPage.current.setLiveView(view)
print(PlaygroundPage.current.liveView.debugDescription.description)
