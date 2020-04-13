//
//  NewEventViewController.swift
//  PBTimeline
//
//  Created by Pablo Blanco González on 25/02/2020.
//  Copyright © 2020 Pablo Blanco. All rights reserved.
//

import UIKit
import PBTimeline

class NewEventViewController: UIViewController {
    
    @IBOutlet var titleLabel: UILabel! {
        didSet {
            titleLabel.textColor = .primaryText
        }
    }

    @IBOutlet var nameLabel: UILabel! {
        didSet {
            nameLabel.textColor = .primaryText
        }
    }
    
    @IBOutlet var priceLabel: UILabel! {
        didSet {
            priceLabel.textColor = .primaryText
        }
    }
    
    @IBOutlet var nameTextField: UITextField! {
        didSet {
            nameTextField.textColor = .primaryText
        }
    }
    
    @IBOutlet var priceTextField: UITextField! {
        didSet {
            priceTextField.textColor = .primaryText
        }
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func commonInit() {
        view.backgroundColor = .background
    }
}
