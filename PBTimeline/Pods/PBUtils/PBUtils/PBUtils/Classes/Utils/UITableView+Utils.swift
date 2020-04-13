//
//  UITableView+Utils.swift
//  PBUtils
//
//  Created by Pablo Blanco González on 11/04/2020.
//  Copyright © 2020 PabloBlanco. All rights reserved.
//

import UIKit

extension UITableView {
    func register(cellIdentifier: String) {
        register(UINib.from(cellIdentifier), forCellReuseIdentifier: cellIdentifier)
    }
    
    func register(forHeaderFooterViewReuseIdentifier cellIdentifier: String) {
        register(UINib.from(cellIdentifier), forHeaderFooterViewReuseIdentifier: cellIdentifier)
    }
    
    func dequeueCell<T: UITableViewCell>(cellType: T.Type, indexPath: IndexPath) -> T {
        guard let cell = dequeueReusableCell(withIdentifier: cellType.defaultReuseIdentifier, for: indexPath) as? T else {
            return T()
        }
        return cell
    }
    
    func dequeueCellForHeader<T: UITableViewHeaderFooterView>(cellType: T.Type) -> T {
        guard let cell = dequeueReusableHeaderFooterView(withIdentifier: cellType.defaultReuseIdentifier) as? T else {
            return T()
        }
        return cell
    }
}
