//
//  MemoryGame.swift
//  Memorize
//
//  Created by 黄紫君 on 02/12/2020.
//  Copyright © 2020 CS193p intro. All rights reserved.
//


// MARK - model
import Foundation

// MemoryGame:  generic type
struct MemoryGame<CardContent> where CardContent: Equatable{
    
    var cards:Array<Card>
    var indexOfTheOnlyFaceUpCard: Int? {
        
        // MARK - using computed property
        get {
//            var faceUpIndicies = Array<Int>()
//            for index in 0..<cards.count {
//                if cards[index].isFaceUp {
//                    faceUpIndicies.append(index)
//                }
//            }
            // The Above Code can be simplified as follows
            
            let faceUpIndicies = cards.indices.filter{index in cards[index].isFaceUp}
            
            
//            if faceUpIndicies.count == 1{
//                return faceUpIndicies.first
//            }
//            else {
//                return nil
//            }
//  The Above Code can be simplified as follows
            return faceUpIndicies.only
            
        }
        set {
            for index in 0..<cards.count {
                 cards[index].isFaceUp = (index == newValue)
            }
        }
        
    }
    
    // MARK - explanation
    /**
     When you want to change a property inside a method, you need to mark it using the mutating keyword
    */
    mutating func choose(card: Card){
        
        // MARK - DEBUG
        print("card chosen: \(card)")
        if let chosenIndex: Int = self.cards.firstIndex(matching: card), !cards[chosenIndex].isFaceUp, !cards[chosenIndex].isMatch{
            
            if let potentialMatchIndex = indexOfTheOnlyFaceUpCard{
                if cards[chosenIndex].content == cards[potentialMatchIndex].content {
                    // == is not built-in function
                    // here use constraints anf gains again
                    cards[chosenIndex].isMatch = true
                    cards[potentialMatchIndex].isMatch = true
                }
                self.cards[chosenIndex].isFaceUp = true
            }
            else {
                indexOfTheOnlyFaceUpCard = chosenIndex
            }
        }
        
        // struct is value type, not changing the original card
        
        
        
        
        
        
        
        
        
        
    }
//
//    func index(of card: Card) -> Int{
//        for index in 0..<self.cards.count{
//            if self.cards[index].id == card.id{
//                return index
//            }
//        }
//        return -1 //TODO : bogus!
//    }
    
    init (numberOfPairsOfCards: Int, cardContentFactory: (Int) -> CardContent) {
        
        cards = Array<Card> ()
        for pairIndex in 0..<numberOfPairsOfCards {
            let content = cardContentFactory(pairIndex)
            cards.append(Card( content: content, id: pairIndex * 2 ))
            cards.append(Card( content: content, id : pairIndex * 2 + 1 ))
        }
    }
    
    // MARK - identifiable : must be unique in one property(here : id)
    struct Card: Identifiable{
        var isFaceUp: Bool = false
        var isMatch: Bool = false
        var content: CardContent
        var id: Int
    }
    
    
    
}
