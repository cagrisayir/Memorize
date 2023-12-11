//
//  ContentView.swift
//  Memorize
//
//  Created by Omer Cagri Sayir on 11.12.2023.
//

import SwiftUI

struct ContentView: View {
    let emojis: Array<String> = ["👻", "🎃", "🕷️", "👿", "💀", "☠️", "🕸️", "🧙", "😱", "🙀", "🍭", "👹"]
    
    @State var cardCount = 4
    
    var body: some View {
        VStack {
            ScrollView {
                cards
            }.scrollIndicators(.hidden)
            Spacer()
            cardCountAdjusters
        }
        .padding()
    }
    
    var cardRemover: some View {
        cardCountAdjuster(by: -1, symbol: "rectangle.stack.fill.badge.minus")
    }
    
    var cardAdder: some View {
        cardCountAdjuster(by: 1, symbol: "rectangle.stack.fill.badge.plus")
    }
    
    var cardResetter: some View {
        Button(action: {
            cardCount = 4
        }, label: {
            HStack{
                Image(systemName: "arrow.clockwise")
            }
        })
    }
    
    var cards: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 120))]) {
            ForEach(0..<cardCount, id: \.self) {index in
                CardView(content: emojis[index])
                    .aspectRatio(2/3, contentMode: .fit)
            }
        }
        .foregroundColor(.orange)
    }
    
    func cardCountAdjuster(by offset: Int, symbol: String) -> some View {
        Button(action: {
            cardCount += offset
        }, label: {
            Image(systemName: symbol)
        })
        .disabled(cardCount + offset < 1 || cardCount + offset > emojis.count)
    }
    
    var cardCountAdjusters: some View {
        HStack {
            cardRemover
            
            Spacer()
            
            cardResetter
            
            Spacer()
            
            cardAdder
        }
        .imageScale(.large)
        .font(.largeTitle)
    }
}

struct CardView: View {
    let content: String
    @State var isFaceUp = true
    
    var body: some View {
        ZStack(alignment: .center) {
            let base = RoundedRectangle(cornerRadius: 12) // Type Inference
            Group {
                base.fill(.white)
                base.strokeBorder(lineWidth: 2)
                
                Text(content).font(.largeTitle)
            }
            .opacity(isFaceUp ? 1 : 0)
            
            base
                .fill()
                .opacity(isFaceUp ? 0 : 1)
        }
        .onTapGesture {
            withAnimation {
                isFaceUp.toggle()
            }
        }
    }
    
}

#Preview {
    ContentView()
}
