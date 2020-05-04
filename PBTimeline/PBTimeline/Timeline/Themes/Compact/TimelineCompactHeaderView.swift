//
//  TimelineCompactHeaderView.swift
//  PBTimeline
//
//  Created by Pablo Blanco González on 15/03/2020.
//  Copyright © 2020 Pablo Blanco. All rights reserved.
//

import UIKit
import MKRingProgressView

class TimelineCompactHeaderView: UITableViewHeaderFooterView, TimelineHeaderViewProtocol {
    
    @IBOutlet weak var titleLabel: UILabel! {
        didSet {
            titleLabel.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        }
    }
    @IBOutlet weak var ringProgressView: UIView! {
        didSet {
            self.ringProgressView.backgroundColor = .clear
        }
    }
    
    var ringCircularProgressView: RingProgressView? {
        didSet {
            guard let ringCircularProgressView = ringCircularProgressView else {
                return
            }
            self.ringProgressView.addSubview(ringCircularProgressView, width: 25, height: 25)
        }
    }
    
    func setup(text: String?, date: Date, position: TimelinePosition, customData: TimelineCustomDataProtocol? = nil) {
        self.titleLabel.text = text
        if let customData = customData as? SpendingData, let dateHash = date.dateHashString {
            let progressData = customData.data(forDateHash: dateHash) as? Double
            self.ringCircularProgressView = RingProgressView(ringProgress: progressData ?? 0.0)
        }
        self.backgroundColor = .clear //.background
    }
    
    
    override func prepareForReuse() {
        super.prepareForReuse()
        ringCircularProgressView?.removeFromSuperview()
    }
}
