//
//  MemorizeGame.swift
//  Memorize
//
//  Created by Omer Cagri Sayir on 12.12.2023.
//

import Foundation

struct MemoryGame<CardContent> {
    var cards: Array<Card>
    
    func choose(card: Card) {
        
    }
    
    struct Card {
        var isFaceUp: Bool
        var isMatched: Bool
        var content: CardContent
    }
}
