
import SwiftUI

public struct AspectVGrid<Item, ItemView>: View where ItemView: View {
    public var items: [Item]
    public var aspectRatio: CGFloat
    public var content: (Item) -> ItemView
    public var body: some View {
        Text("Hello, World!")
    }
}
