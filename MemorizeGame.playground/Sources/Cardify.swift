import SwiftUI
public struct Cardify: ViewModifier {
    var isFaceUp: Bool
    
    public init(isFaceUp: Bool) {
        self.isFaceUp = isFaceUp
    }
    
    public func body(content: Content) -> some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: DrawingConstants.cornderRadius)
            if isFaceUp {
                shape.fill()
                    .foregroundColor(.white)
                shape.strokeBorder(lineWidth: DrawingConstants.lineWidth)
                content
            } else {
                shape.fill()
            }
        }
    }
    
    private struct DrawingConstants {
        static let cornderRadius: CGFloat = 10
        static let lineWidth: CGFloat = 3
    }
}
