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
            CardView(isFaceUp: true)
            CardView()
            CardView()
            CardView()
        }
        .foregroundColor(.orange)
        .padding()
    }
}

struct CardView: View {
    @State var isFaceUp = false
    
    var body: some View {
        ZStack(alignment: .center) {
            let base = RoundedRectangle(cornerRadius: 12) // Type Inference
            if isFaceUp {
                base.fill(.white)
                base.strokeBorder(lineWidth: 2)
                
                Text("😜").font(.largeTitle)
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
