//
//  Array+Utils.swift
//  PBUtils
//
//  Created by Pablo Blanco González on 19/04/2020.
//  Copyright © 2020 PabloBlanco. All rights reserved.
//

import Foundation

public extension Array {
    // Overwrites subscript to get safe access to an array index
    subscript (safe index: Int) -> Element? {
        return self.indices ~= index ? self[index] : nil
    }
}
