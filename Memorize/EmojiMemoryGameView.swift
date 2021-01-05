//
//  ContentView.swift
//  Memorize
//
//  Created by 黄紫君 on 30/11/2020.
//  Copyright © 2020 CS193p intro. All rights reserved.
//

import SwiftUI
// ALL UI stuff is in SwiftUI

// struct has var, fun


// constrain and gains :e.g. view
struct EmojiMemoryGameView: View {
    @ObservedObject var viewModel: EmojiMemoryGame
    
    // var body is called by the system
    
    var body: some View {
       //return Text("Hello there, World!") // brick legos
        // return the value as the value of body , return can be left out
        // some view : let the compiler figure out what kind of view will be returned
        // Text is a kind of view
        // every var has a specific type and value
        
        Grid(items: viewModel.cards) {
            card in CardView(card: card).onTapGesture {
                self.viewModel.choose(card: card)
            }.padding(5)
        }
            .padding()
            .foregroundColor(Color.orange)
        
  /*
        
        // MARK - using GRID (rows and columns)
        Grid(items: viewModel.cards) { card in
            // curly brace : inferring function
            // this function takes card as parameter and return CardView
            CardView(card: card).onTapGesture{
                self.viewModel.choose(card: card)
            }
        }
            .padding()
            .foregroundColor(Color.orange)
**/
        
        // MARK - using HStack  (only colums)
//        HStack{
//            // follows a function
//            ForEach(viewmodel.cards){
//                card in CardView(card: card).onTapGesture{self.viewmodel.choose(card: card)}
//
//            }
//        }
//                         .padding()
//                         .foregroundColor(Color.yellow)
//                         .font(Font.largeTitle)
            // MARK - must be identifiable and iterable in ForEach
//
//            ForEach(viewmodel.cards){card in CardView(card: card).onTapGesture(perform: {
//                viewmodel.choose(card: card)
//            })}
//             }
//             .padding()
//             .foregroundColor(Color.orange)
//             .font(Font.largeTitle)
        
        



//
//    // inside the view builder you cannot use var
//    if card.isFaceUp{
//        RoundedRectangle(cornerRadius: 10.0).fill(Color.white)
//        RoundedRectangle(cornerRadius:10.0).stroke(lineWidth:3)
//        Text(card.content)
//    }
//    else {
//        RoundedRectangle(cornerRadius: 10.0).fill()
//    }
//}
        }
}
struct CardView: View{
    var card: MemoryGame<String>.Card
    
    var body:some View{
        GeometryReader{geometry in self.body(for: geometry.size)}
    }
    



    func body(for size: CGSize) -> some View{
    
        ZStack{
            // curly brace : function
            // MARK - takes no argument and return sth
            
            if card.isFaceUp {
                RoundedRectangle(cornerRadius: cornerRadius).fill(Color.white)
                // fill : color of the rounderRectangle
                RoundedRectangle(cornerRadius: cornerRadius).stroke(lineWidth: edgeLineWidth)
                // stroke : line width of the stroke
                Text(card.content)
            }
            else {
                if(!card.isMatch){
                RoundedRectangle(cornerRadius: cornerRadius).fill()
                }
            }

        }.font(Font.system(size:fontSize(for: size)))
        
        /**
         VStack {
             Text("Font applied to a text view.")
                 .font(.largeTitle)
             // determinded by ".font(.largeTitle)"
             VStack {
                 Text("These 2 text views have the same font")
                 Text("applied to their parent hierarchy")
             }
            // determinded by ".font(.system(size: 16, weight: .light, design: .default))"
         }
         .font(.system(size: 16, weight: .light, design: .default))
         */
    
    
    }
    // MARK - Drawing Constants
    
    let cornerRadius: CGFloat = 10.0
    let edgeLineWidth: CGFloat = 3
    let fontScaleFactor: CGFloat = 0.75
    
    func fontSize(for size: CGSize) -> CGFloat{
        
        min(size.width, size.height) * fontScaleFactor
        
    }
    
}
// MATK -TEST
//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//       ContentView(viewmodel: EmojiMemoryGame_viewmodel())
//    }
//}


struct EmojiMemoryGameView_Previews: PreviewProvider {
    static var previews: some View {
        EmojiMemoryGameView(viewModel:EmojiMemoryGame())
    }
}
