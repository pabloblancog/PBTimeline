//
//  UICollectionViewCell+Utils.swift
//  PBUtils
//
//  Created by Pablo Blanco González on 11/04/2020.
//  Copyright © 2020 PabloBlanco. All rights reserved.
//

import UIKit

extension UICollectionView {
    func register(cellIdentifier: String) {
        register(UINib.from(cellIdentifier).self, forCellWithReuseIdentifier: cellIdentifier)
    }
}
