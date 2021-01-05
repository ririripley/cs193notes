//
//  Array+Identifiable.swift
//  Memorize
//
//  Created by 黄紫君 on 12/12/2020.
//  Copyright © 2020 CS193p intro. All rights reserved.
//

import Foundation


// constraints and gains
extension Array where Element:Identifiable{
    func firstIndex(matching: Element) ->Int? {
        for index in 0..<self.count{
            
            if(self[index].id == matching.id){
                return index
            }
        }
        // return nil
        return 0
    }
}
