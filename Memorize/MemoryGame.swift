//
//  MemorizeGame.swift
//  Memorize
//
//  Created by Murilo Favero Oliveira on 23/02/24.
//

import Foundation

struct MemoryGame<CardContent> {
    var cards: Array<Card>
    
    func choose(card: Card) {
        
    }
    
    struct Card{
        var isFaceUp: Bool
        var isMatched: Bool
        var content: CardContent //don't care type
    }
}
