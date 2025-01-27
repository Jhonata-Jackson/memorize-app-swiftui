//
//  ContentView.swift
//  Memorize
//
//  Created by Jhonata Jackson on 12/12/24.
//

import SwiftUI

struct ContentView: View {
    let emojis: [String] = ["👻", "🎃", "🕷️", "💀", "🧙🏽‍♀️", "🙀", "👹", "🕸️", "🍭", "😱", "🌑", "🕯️"]
    
    @State var cardCount = 4
    
    var body: some View {
        VStack {
            cards
            cardCountAdjusters
        }
        .padding()
    }
    
    var cards: some View {
        HStack {
            ForEach(0..<cardCount, id: \.self) { index in
                CardView(content: emojis[index])
            }
        }
        .foregroundColor(.orange)
    }
    
    var cardCountAdjusters: some View {
        HStack {
            cardRemover
            Spacer()
            cardAdder
        }
        .imageScale(.large)
        .font(.title)
    }
    
    var cardRemover: some View {
        Button(action: {
            if cardCount > 1 {
                cardCount -= 1
            }
        }, label: {
            Image(systemName: "rectangle.stack.fill.badge.minus")
        })
    }
    
    var cardAdder: some View {
        Button(action: {
            if cardCount < emojis.count {
                cardCount += 1
            }
        }, label: {
            Image(systemName: "rectangle.stack.fill.badge.plus")
        })
    }
}

struct CardView: View {
    let content: String
    @State var isFaceUp: Bool = true
    
    var body: some View {
        ZStack {
            if isFaceUp {
                RoundedRectangle(cornerRadius: 12)
                    .foregroundColor(.white)
                RoundedRectangle(cornerRadius: 12)
                    .stroke(lineWidth: 2)
                Text(content)
                    .font(.largeTitle)
            } else {
                RoundedRectangle(cornerRadius: 12).fill()
            }
        } .onTapGesture {
            isFaceUp.toggle()
        }
    }
}

#Preview {
    ContentView()
}
