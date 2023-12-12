//
//  ContentView.swift
//  Memorize
//
//  Created by Omer Cagri Sayir on 11.12.2023.
//

import SwiftUI

struct ContentView: View {
    let emojis: Array<String> = ["👻", "🎃", "🕷️", "👿", "💀", "☠️", "🕸️", "🧙", "😱", "🙀", "🍭", "👹"]
    
    var body: some View {
        
        ScrollView {
            cards
        }.scrollIndicators(.hidden)
        
            .padding()
    }
    
    var cards: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 120))]) {
            ForEach(emojis.indices, id: \.self) {index in
                CardView(content: emojis[index])
                    .aspectRatio(2/3, contentMode: .fit)
            }
        }
        .foregroundColor(.orange)
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
