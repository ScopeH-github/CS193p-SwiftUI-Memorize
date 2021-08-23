import SwiftUI
public struct Cardify: ViewModifier {
    public func body(content: Content) -> some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: DrawingConstants.cornderRadius)
            if card.isFaceUp {
                shape.fill()
                    .foregroundColor(.white)
                shape.strokeBorder(lineWidth: DrawingConstants.lineWidth)
                Pie(startAngle: Angle(degrees: 0-90), endAngle: Angle(degrees: 110-90))
                    .padding(5).opacity(0.6)
                Text(card.content).font(font(in: geometry.size))
            } else {
                shape.fill()
            }
        }
    }
}
