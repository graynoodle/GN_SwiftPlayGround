//
//  Card.swift
//  GN_SwiftPlayGround
//
//  Created by graynoodle on 2019/5/8.
//  Copyright © 2019 graynoodle. All rights reserved.
//

import Foundation

struct Card {
    var isFaceUp = false
    var isMatched = false
    var identifier: Int
    
    static var identifierFactory = 0
    
    static func getUniqueIdentifier() -> Int {
        identifierFactory += 1
        return identifierFactory
    }
    init() {
        self.identifier = Card.getUniqueIdentifier()
    }
}
