
import SwiftUI

public struct AspectVGrid<Item, ItemView>: View where ItemView: View, Item: Identifiable {
    public var items: [Item]
    public var aspectRatio: CGFloat
    public var content: (Item) -> ItemView
    
    public init(items: [Item], aspectRatio: CGFloat, content: @escaping (Item) -> ItemView) {
        self.items = items
        self.aspectRatio = aspectRatio
        self.content = content
    }
    
    public var body: some View {
        let width: CGFloat = 100
        LazyVGrid(columns: [GridItem(.adaptive(minimum: width))]) {
            ForEach(items) { item in
                content(item).aspectRatio(aspectRatio, contentMode: .fit)
            }
        }
    }
}
