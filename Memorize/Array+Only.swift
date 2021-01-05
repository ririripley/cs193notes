//
//  Array+Only.swift
//  Memorize
//
//  Created by 黄紫君 on 13/12/2020.
//  Copyright © 2020 CS193p intro. All rights reserved.
//

import Foundation

extension Array {
    var only: Element? {
        self.count == 1 ? self.first : nil
    }
}
