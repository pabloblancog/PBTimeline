//
//  TimelineMinimalTableViewCell.swift
//  PBTimeline
//
//  Created by Pablo Blanco González on 09/03/2020.
//  Copyright © 2020 Pablo Blanco. All rights reserved.
//

import UIKit

class TimelineMinimalTableViewCell: UITableViewCell, TimelineCellProtocol {
    
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
    @IBOutlet weak var categoryImageView: UIImageView? {
        didSet {
            categoryImageView?.layer.cornerRadius = 5.0
            categoryImageView?.backgroundColor = .lightGray
            categoryImageView?.contentMode = .scaleAspectFit
        }
    }
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
            categoryImageView?.image = event?.category.icon
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
    }
}
