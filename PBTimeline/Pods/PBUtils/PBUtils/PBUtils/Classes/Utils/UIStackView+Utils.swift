//
//  UIStackView+Utils.swift
//  PBUtils
//
//  Created by Pablo Blanco González on 11/04/2020.
//  Copyright © 2020 PabloBlanco. All rights reserved.
//

import UIKit

extension UIStackView {
    
    @discardableResult
    func addView(_ view: UIView, height: CGFloat, width: CGFloat) -> (widthConstraint: NSLayoutConstraint, heightConstraint: NSLayoutConstraint) {
        
        let heightConstraint = view.heightAnchor.constraint(equalToConstant: height)
        heightConstraint.isActive = true
        
        let widthConstraint = view.widthAnchor.constraint(equalToConstant: width)
        widthConstraint.isActive = true
        
        self.addArrangedSubview(view)
        
        return (widthConstraint, heightConstraint)
    }
    
    func removeView(_ view: UIView) {
        self.removeArrangedSubview(view)
    }
    
    func getViewIndex(_ view: UIView) -> Int? {
        return self.arrangedSubviews.firstIndex(of: view)
    }

    func addBackground(color: UIColor, cornerRadius: CGFloat = 0.0, corners: CACornerMask?) {
        let subView = UIView(frame: bounds)
        subView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        subView.addBackground(color: color)
        subView.setCorners(cornerRadius: cornerRadius, corners: corners)
        insertSubview(subView, at: 0)
    }
}
