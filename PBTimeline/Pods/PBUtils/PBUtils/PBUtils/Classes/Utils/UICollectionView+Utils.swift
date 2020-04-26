//
//  UICollectionView+Utils.swift
//  PBUtils
//
//  Created by Pablo Blanco González on 21/04/2020.
//  Copyright © 2020 PabloBlanco. All rights reserved.
//

import Foundation

public extension UICollectionView {
    func register(cellIdentifier: String) {
        register(UINib.from(cellIdentifier), forCellWithReuseIdentifier: cellIdentifier)
    }
    
    func dequeueCell<T: UICollectionViewCell>(cellType: T.Type, indexPath: IndexPath) -> T {
        guard let cell = dequeueReusableCell(withReuseIdentifier: cellType.defaultReuseIdentifier, for: indexPath) as? T else {
            return T()
        }
        return cell
    }
}
