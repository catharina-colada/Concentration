//
//  Concentration.swift
//  Concentration
//
//  Created by Johan Haglund Malm on 2018-11-27.
//  Copyright © 2018 Johan Haglund Malm. All rights reserved.
//

import Foundation

class Concentration
{
    var cards = [Card]()
    
    var indexOfOneAndOnlyFaceUpCard: Int? {
        get {
            var foundIndex: Int?
            for index in cards.indices {
                
                if cards[index].isFaceUp {
                    if foundIndex == nil {
                        foundIndex = index
                        
                    } else {
                        return nil
                    }
                }
            }
            return foundIndex
    }
        
        set(newValue) {
            for index in cards.indices {
                let matchedIndex: Bool = (index == newValue)
                cards[index].isFaceUp = matchedIndex
            }
        }
    }
        
        
        
        
    
    func chooseCard(at index: Int) {
        
        if !cards[index].isMatched {
            if let matchIndex = indexOfOneAndOnlyFaceUpCard, matchIndex != index {
                if cards[matchIndex].indentifier == cards[index].indentifier {
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                }
                cards[index].isFaceUp = true
  
            } else {
                indexOfOneAndOnlyFaceUpCard = index
            }
        }
    }
    
    init(numberOfPairsOfCards: Int) {
        for _ in 1...numberOfPairsOfCards {
            let card = Card()
            cards += [card, card]
        }
        
        // TODO: Shuffle the cards
    }
}
