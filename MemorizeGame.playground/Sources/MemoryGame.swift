import Foundation

public struct MemoryGame<CardContent> {
    
    private(set) var cards: Array<Card>
    
    func choose(_ card: Card) {
        
    }
    
    public init(numberOfPairsOfCards: Int, createCardContent: (Int) -> CardContent) {
        cards = Array<Card>()
            // add numberOfCards x 2 cards to cards array
        for pairIndex in 0..<numberOfPairsOfCards {
            let content: CardContent = createCardContent(pairIndex)
            cards.append(Card(content: content, id: pairIndex*2))
            cards.append(Card(content: content, id: pairIndex*2+1))
        }
    }
    
    public struct Card: Identifiable {
        public var isFaceUp: Bool = true
        public var isMatched: Bool = false
        public var content: CardContent
        
        public var id: Int
    }
    
}
