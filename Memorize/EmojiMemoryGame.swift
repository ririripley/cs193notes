//
//  EmojiMemoryGame_viewmodel.swift
//  Memorize
//
//  Created by 黄紫君 on 02/12/2020.
//  Copyright © 2020 CS193p intro. All rights reserved.
//

import Foundation
// MARK - responsible for creating the card content in the card 


// MARK - EmojiMemoryGame_viewmodel is a class 
class EmojiMemoryGame: ObservableObject{
    
    // MARK - set as private
    //private var model:MemoryGame<String> = MemoryGame<String>(numberOfPairsOfCards: 2, cardContentFactory:createCardContent)
    @Published private var model:MemoryGame<String> = EmojiMemoryGame.createMemoryGame()
    
    static func createMemoryGame()->MemoryGame<String>{
        let emojis = ["👻","😬","🙈"]
        return MemoryGame<String>(numberOfPairsOfCards: emojis.count) {
            pairIndex in return emojis[pairIndex]
        }
    }
    
    
    
    // MARK - access to the model
    var cards: Array<MemoryGame<String>.Card>{
        return model.cards
    }
    
    func choose(card:MemoryGame<String>.Card) {
        model.choose(card: card)
    }
    
}
