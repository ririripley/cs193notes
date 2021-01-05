//
//  Grid.swift
//  Memorize
//
//  Created by 黄紫君 on 12/12/2020.
//  Copyright © 2020 CS193p intro. All rights reserved.
//

import SwiftUI

struct Grid<Item,ItemView>: View where Item: Identifiable, ItemView: View  {
    // generics
    // Grid is a container
    var items: [Item]
    var viewForItem: (Item)->ItemView
     
    init(items:[Item], viewForItem:@escaping (Item)->ItemView){
        self.items = items
        self.viewForItem = viewForItem
        // since you do not use the function in the "init" function, so
        // you need to declare it as @escaping to tell the code to store in heap
        
    }
    
    var body: some View {
        /*
        GeometryReader{
            // takes function as parameter
            // since the parameter is the last one, we can use curly brace to express it
            // the return type is view
            geometry in ForEach(items){
                item in self.viewForItem(item)
            }
        }
         **/
        
        GeometryReader{ geometry in
            self.body(for: GridLayout(itemCount: items.count, in: geometry.size))
        }
        
    }
        
        
        
        func body(for layout: GridLayout) -> some View{
            ForEach(items) {
                item in self.body(for: item, in: layout)
            }
        }
    
       func body(for item: Item,in layout: GridLayout)-> some View{
        
        // this function has to return view type thing
        
        let index = items.firstIndex(matching: item)
        
        // Group:like Zstack, is a viewBuilder
        return Group{
            if index != nil{
                 viewForItem(item)
                .frame(width: layout.itemSize.width, height: layout.itemSize.height)
                // frame : set the width and height for the view
                .position(layout.location(ofItemAt: index!))
                //.position(layout.location(ofItemAt: index))
            }
            // if index == nil , return a group returing emptyView(empty content)
        }
        
            
       }
    
//    func index(of item: Item) -> Int? {
//        for index in 0..<items.count{
//            if items[index].id == item.id{
//                return index
//            }
//        }
//        return nil
//    }
// This code is similar to the one "index" function in MemoryGame
// So we summarize it in the file Array+Idenfiable
        
     
        
}



// MARK - for canvas

//struct Grid_Previews: PreviewProvider {
//    static var previews: some View {
//        Grid()
//    }
//}

