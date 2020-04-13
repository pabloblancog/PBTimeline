//
//  ReusableViewProtocol.swift
//  PBUtils
//
//  Created by Pablo Blanco González on 11/04/2020.
//  Copyright © 2020 PabloBlanco. All rights reserved.
//

import UIKit

protocol ReusableViewProtocol: class {
    static var defaultReuseIdentifier: String { get }
}

extension ReusableViewProtocol where Self: UIView {
    static var defaultReuseIdentifier: String {
        return String(describing: self)
    }
}

extension UICollectionViewCell: ReusableViewProtocol { }

extension UITableViewCell: ReusableViewProtocol { }

extension UITableViewHeaderFooterView: ReusableViewProtocol { }
