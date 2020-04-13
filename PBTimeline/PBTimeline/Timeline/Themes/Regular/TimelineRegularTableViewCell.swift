//
//  TimelineTableViewCell.swift
//  PBTimeline
//
//  Created by Pablo Blanco González on 08/02/2020.
//  Copyright © 2020 Pablo Blanco. All rights reserved.
//

import UIKit

class TimelineRegularTableViewCell: UITableViewCell, TimelineCellProtocol {
    
    @IBOutlet weak var eventTitleLabel: UILabel! {
        didSet {
            eventTitleLabel.font = UIFont.systemFont(ofSize: 18,
                                                     weight: .regular)
        }
    }
    @IBOutlet weak var eventDescriptionLabel: UILabel? {
        didSet {
            eventDescriptionLabel?.font = UIFont.systemFont(ofSize: 14,
                                                            weight: .light)
        }
    }
    @IBOutlet weak var eventPriceLabel: UILabel? {
        didSet {
            eventPriceLabel?.font = UIFont.systemFont(ofSize: 18,
                                                      weight: .bold)
            eventPriceLabel?.textAlignment = .right
        }
    }

    @IBOutlet weak var bubbleLineView: BubbleLineView!
    @IBOutlet weak var dataStackView: UIStackView! {
        didSet {
            dataStackView.addBackground(color: .cellBackground, cornerRadius: 10.0, corners: nil)
            dataStackView.layoutMargins = UIEdgeInsets(top: 20,
                                                       left: 20,
                                                       bottom: 20,
                                                       right: 20)
            dataStackView.isLayoutMarginsRelativeArrangement = true
        }
    }

    var delegate: TimelineEventDelegate?
    var event: TimelineEventProtocol? {
        didSet {
            eventTitleLabel?.text = event?.title
            eventDescriptionLabel?.text = event?.description
            eventPriceLabel?.text = "\(event?.price ?? 0.0)€"
            eventPriceLabel?.isHidden = event?.price == nil
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        commonInit()
    }
        
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    func commonInit() {
        backgroundColor = .background
        selectionStyle = .none
    }
    
    func setEvent(_ event: TimelineEventProtocol, position: EventTimelinePosition) {
        self.event = event
        
        let setup = BubbleLineView.BubbleLineSetup.setup(fromPosition: position)
        let bubbleType = BubbleType.image(image: event.category.icon)
        bubbleLineView.setup(setup: setup, bubbleType: bubbleType)
    }
}
