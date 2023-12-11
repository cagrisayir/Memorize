//
//  ContentView.swift
//  Memorize
//
//  Created by Omer Cagri Sayir on 11.12.2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HStack {
            let emojis: Array<String> = ["👻", "🎃", "🕷️", "👿"]
            ForEach(emojis.indices, id: \.self) {index in
                CardView(content: emojis[index])
            }
        }
        .foregroundColor(.orange)
        .padding()
    }
}

struct CardView: View {
    let content: String
    @State var isFaceUp = false
    
    var body: some View {
        ZStack(alignment: .center) {
            let base = RoundedRectangle(cornerRadius: 12) // Type Inference
            if isFaceUp {
                base.fill(.white)
                base.strokeBorder(lineWidth: 2)
                
                Text(content).font(.largeTitle)
            } else {
                base
                    .fill()
            }
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
