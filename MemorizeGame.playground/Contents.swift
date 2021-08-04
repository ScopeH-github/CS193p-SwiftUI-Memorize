import SwiftUI
import PlaygroundSupport

struct ContentView: View {
    var emojis = ["🚲", "🚂", "🚁", "🚜", "🏎", "🚑", "🚓", "🚒", "✈️", "🚀", "⛵️", "🛸", "🛶", "🚌", "🏍", "🛺", "🚠", "🛵", "🚗", "🚚", "🚇", "🛻", "🚝"]
    @State var emojiCount = 6
    
    var body: some View {
        VStack {
            
            HStack {
                ForEach(emojis[0..<emojiCount], id: \.self) { emoji in
                    CardView(content: emoji)
                }
            }
            HStack {
                remove
                Spacer()
                add
            }.padding(.horizontal)
        }
        .padding(.horizontal)
        .foregroundColor(.orange)
    }
    
    var remove: some View {
        Button(action: {
            emojiCount -= 1
        }) { 
            VStack {
                Text("Remove")
                Text("Card")
            }
        }
    }
    
    var add: some View {
        Button(action: {
            emojiCount += 1
        }) { 
            VStack {
                Text("Add")
                Text("Card")
            }
        }
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
