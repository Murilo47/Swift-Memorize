//
//  MemorizeGame.swift
//  Memorize
//
//  Created by Murilo Favero Oliveira on 23/02/24.
//

import Foundation

struct MemoryGame<CardContent> {
    private(set) var cards: Array<Card>
    //private(set) means that it is private to set, but it is public to see/look at it
    
    init(numberOfPairsOfCards: Int, cardContentFactory: (Int) -> CardContent) {
        cards = []
        //add numberOfPairsOfCards x 2 cards
        
        for pairIndex in 0..<max(2, numberOfPairsOfCards) { //we don't use the index
            let content = cardContentFactory(pairIndex)
            cards.append(Card(content: content))
            cards.append(Card(content: content))
        }
        
    }
    
    func choose(_ card: Card) {
        
    }
    
    mutating func shuffle() {
        cards.shuffle()
    }
    
    struct Card{
        var isFaceUp = true
        var isMatched = false
        let content: CardContent //don't care type
    }
}
