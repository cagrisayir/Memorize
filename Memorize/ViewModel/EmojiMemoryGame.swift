//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Omer Cagri Sayir on 12.12.2023.
//

import SwiftUI


class EmojiMemoryGame: ObservableObject {
    private static let emojis = ["👻", "🎃", "🕷️", "👿", "💀", "☠️", "🕸️", "🧙", "😱", "🙀", "🍭", "👹"]
    
    @Published private var model = MemoryGame(numberOfPairsOfCards: 4) { pairIndex in
        if emojis.indices.contains(pairIndex) {
            return emojis[pairIndex]
        } else {
            return "⁉️"
        }
    }
    
    var cards: [MemoryGame<String>.Card] {
        return model.cards
    }
    
    // MARK: - Intents
    
    func shuffle(){
        model.shuffle()
    }
    
    func choose(_ card: MemoryGame<String>.Card) {
        model.choose(card)
    }
    
}
