//
//  MemorizeGame.swift
//  Memorize
//
//  Created by Murilo Favero Oliveira on 23/02/24.
//

import Foundation

struct MemoryGame<CardContent> where CardContent: Equatable { //here we care a little bit about the CardContent => must be equatable
    private(set) var cards: Array<Card>
    //private(set) means that it is private to set, but it is public to see/look at it
    
    init(numberOfPairsOfCards: Int, cardContentFactory: (Int) -> CardContent) {
        cards = []
        //add numberOfPairsOfCards x 2 cards
        
        for pairIndex in 0..<max(2, numberOfPairsOfCards) { //we don't use the index
            let content = cardContentFactory(pairIndex)
            cards.append(Card(content: content, id: "\(pairIndex+1)a"))
            cards.append(Card(content: content, id: "\(pairIndex+1)b"))
        }
        
    }
    
    mutating func choose(_ card: Card) {
        let chosenIndex = index(of: card)
        cards[chosenIndex].isFaceUp.toggle()
        
        //        print("chose \(card)")
    }
    
    func index(of card: Card) -> Int {
        for index in cards.indices {
            if cards[index].id == card.id {
                return index
            }
        }
        return 0 // FIXME: bogus!
    }
    
    mutating func shuffle() {
        cards.shuffle()
//        print(cards)
    }
    
    struct Card: Equatable, Identifiable, CustomDebugStringConvertible {
        
//        static func == (lhs: Card, rhs: Card) -> Bool {
//            return lhs.isFaceUp == rhs.isFaceUp &&
//            lhs.isMatched == rhs.isMatched &&
//            lhs.content == rhs.content
//        }
        // I don't need this because swift can see all my vars are equatable, so it figured out how to compare them
        
        var isFaceUp = true
        var isMatched = false
        let content: CardContent //don't care type
        
        var id: String
        
        var debugDescription: String {
            "\(id): \(content) \(isFaceUp ? "up" : "down") \(isMatched ? "matched" : "")"
        }
    }
}
