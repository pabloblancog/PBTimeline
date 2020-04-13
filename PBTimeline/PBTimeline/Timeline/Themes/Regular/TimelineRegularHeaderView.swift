//
//  TimelineRegularHeaderView.swift
//  PBTimeline
//
//  Created by Pablo Blanco González on 15/02/2020.
//  Copyright © 2020 Pablo Blanco. All rights reserved.
//

import UIKit

protocol TimelineHeaderViewProtocol: UITableViewHeaderFooterView {
    func setup(text: String?, date: Date, position: TimelinePosition, customData: TimelineCustomDataProtocol?)
}

class TimelineRegularHeaderView: UITableViewHeaderFooterView, TimelineHeaderViewProtocol {
    
    @IBOutlet weak var bubbleLineView: BubbleLineView!
    @IBOutlet weak var titleLabel: UILabel! {
        didSet {
            titleLabel.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        }
    }
    
    var position: TimelinePosition = .none {
        didSet {
            switch position {
            case .top:
                bubbleLineView.setup(setup: .top(displayBubble: false), bubbleType: .image(image: nil))
            case .bottom:
                bubbleLineView.setup(setup: .bottom(displayBubble: false), bubbleType: .image(image: nil))
            case .middle:
                bubbleLineView.setup(setup: .full(displayBubble: false), bubbleType: .image(image: nil))
            case .singleElement:
                bubbleLineView.setup(setup: .full(displayBubble: false), bubbleType: .image(image: nil))
            case .none:
                bubbleLineView.setup(setup: .none(displayBubble: false), bubbleType: .image(image: nil))
            }
        }
    }
    
    func setup(text: String?, date: Date, position: TimelinePosition, customData: TimelineCustomDataProtocol? = nil) {
        self.position = position
        self.titleLabel.text = text
        self.backgroundColor = .background
    }
}
