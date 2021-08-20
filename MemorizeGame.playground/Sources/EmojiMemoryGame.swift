// Model Area

import SwiftUI

public class EmojiMemoryGame: ObservableObject {
    public typealias Card = MemoryGame<String>.Card
    
    private static let emojis = ["🚲", "🚂", "🚁", "🚜", "🏎", "🚑", "🚓", "🚒", "✈️", "🚀", "⛵️", "🛸", "🛶", "🚌", "🏍", "🛺", "🚠", "🛵", "🚗", "🚚", "🚇", "🛻", "🚝"]
    
    private static func createMemoryGame() -> MemoryGame<String> {
        MemoryGame<String>(numberOfPairsOfCards: 4) { pairIndex in
            EmojiMemoryGame.emojis[pairIndex]
        }
    }
    
    @Published private var model = createMemoryGame()
    
    public var cards: Array<Card> {
        return model.cards
    }
    
    // MARK: - Intent(s)
    public func choose(_ card: Card) {
        model.choose(card)
    }
    
    public init() {}
}
