//
//  EmojiMemoryGameView.swift
//  Memorize
//
//  Created by Murilo Favero Oliveira on 11/05/22.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    var viewModel: EmojiMemoryGame
    
    let emojis = ["👻", "🎃", "🕷️", "😈", "💀", "🕸️", "🧙", "🙀", "👹", "😱", "☠️", "🍭"]
    
    var body: some View {
        ScrollView {
            cards.padding()
        }
        .padding()
    }
    
    var cards: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 60))]) {
            ForEach(emojis.indices, id: \.self) { index in
                CardView(content: emojis[index])
                    .aspectRatio(2/3, contentMode: .fit)
            }
        }
        .foregroundColor(.orange)
    }
}

struct CardView: View {
    let content: String
    @State var isFaceUp = true ///default to false  /// State is creating a pointer to isFaceUp
    
    var body: some View {
        ZStack {
            let base = RoundedRectangle(cornerRadius: 12.0) ///can be var, but let doesn't change
            Group {
                base.stroke(lineWidth: 3.0)
                base.foregroundColor(.white)
                Text(content).font(.largeTitle)
            }
            .opacity(isFaceUp ? 1 : 0)
            base.fill().opacity(isFaceUp ? 0 : 1)
        }
        .onTapGesture {
            isFaceUp.toggle()
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
