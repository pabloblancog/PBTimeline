//
//  UINib+Utils.swift
//  PBUtils
//
//  Created by Pablo Blanco González on 11/04/2020.
//  Copyright © 2020 PabloBlanco. All rights reserved.
//

import UIKit

extension UINib {
    class func from(_ nibName: String) -> UINib? {
        guard !nibName.isEmpty else {
            return nil
        }
        
        return UINib(nibName: nibName, bundle: nil)
    }
}
