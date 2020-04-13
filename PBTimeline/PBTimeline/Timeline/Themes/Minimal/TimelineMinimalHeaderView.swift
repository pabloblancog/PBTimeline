//
//  TimelineMinimalHeaderView.swift
//  PBTimeline
//
//  Created by Pablo Blanco González on 09/03/2020.
//  Copyright © 2020 Pablo Blanco. All rights reserved.
//

import UIKit

class TimelineMinimalHeaderView: UITableViewHeaderFooterView, TimelineHeaderViewProtocol {
    
    @IBOutlet weak var titleLabel: UILabel! {
        didSet {
            titleLabel.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        }
    }
    
    func setup(text: String?, date: Date, position: TimelinePosition, customData: TimelineCustomDataProtocol? = nil) {
        self.titleLabel.text = text
        self.backgroundColor = .background
    }
}
