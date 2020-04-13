//
//  NibFileOwnerLoadable.swift
//  PBUtils
//
//  Created by Pablo Blanco González on 11/04/2020.
//  Copyright © 2020 PabloBlanco. All rights reserved.
//

import UIKit

public protocol NibFileOwnerLoadable: class {
    static var nib: UINib { get }
}

public extension NibFileOwnerLoadable where Self: UIView {
    
    static var nib: UINib {
        return UINib(nibName: String(describing: self), bundle: Bundle(for: self))
    }
    
    func instantiateFromNib() -> UIView? {
        let view = Self.nib.instantiate(withOwner: self, options: nil).first as? UIView
        return view
    }
    
    func loadNibContent() {
        guard let view = instantiateFromNib() else {
            fatalError("Failed to instantiate nib \(Self.nib)")
        }
        view.translatesAutoresizingMaskIntoConstraints = false
        addSubview(view, margins: Margins(top: 0.0, leading: 0.0, bottom: 0.0, trailing: 0.0))
    }
}

extension UIView: NibFileOwnerLoadable {}
