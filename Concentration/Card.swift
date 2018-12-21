//
//  Card.swift
//  Concentration
//
//  Created by Johan Haglund Malm on 2018-11-27.
//  Copyright © 2018 Johan Haglund Malm. All rights reserved.
//

import Foundation

struct Card
{ /*How the cards behave, not displayed*/
    /* These variables are stored with the card*/
    var isFaceUp = false
        var isMatched = false
        var indentifier: Int
    
    /* These variables are stored with the type*/
    
    static var indentifierFactory = 0
    
    static func getUniqueIndentifier() -> Int {
        Card.indentifierFactory += 1
        return Card.indentifierFactory
    }
    
    init()
    {
        self.indentifier = Card.getUniqueIndentifier()
    }
    
}
