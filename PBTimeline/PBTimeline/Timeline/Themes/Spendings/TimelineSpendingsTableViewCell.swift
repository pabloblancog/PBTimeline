//
//  TimelineSpendingsTableViewCell.swift
//  PBTimeline
//
//  Created by Pablo Blanco González on 15/03/2020.
//  Copyright © 2020 Pablo Blanco. All rights reserved.
//

import UIKit

class TimelineSpendingsTableViewCell: UITableViewCell, TimelineCellProtocol {
    
    @IBOutlet weak var topMarginConstraint: NSLayoutConstraint!
    @IBOutlet weak var bottomMarginConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var eventTitleLabel: UILabel! {
        didSet {
            eventTitleLabel.font = UIFont.systemFont(ofSize: 16,
                                                     weight: .regular)
        }
    }
    @IBOutlet weak var eventDescriptionLabel: UILabel? {
        didSet {
            eventDescriptionLabel?.font = UIFont.systemFont(ofSize: 14,
                                                            weight: .light)
            eventDescriptionLabel?.textColor = UIColor.gray
        }
    }
    @IBOutlet weak var eventPriceLabel: UILabel? {
        didSet {
            eventPriceLabel?.font = UIFont.systemFont(ofSize: 16,
                                                      weight: .regular)
            eventPriceLabel?.textAlignment = .right
            eventPriceLabel?.textColor = .blue
        }
    }

    @IBOutlet weak var dataStackView: UIStackView! {
        didSet {
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
    var position: EventTimelinePosition = EventTimelinePosition(rowPosition: .middle, sectionPosition: .middle) {
        didSet {
            let dataStackViewBackground = UIView.backgroundView(frame: dataStackView.bounds,
                                                                color: .cellBackground,
                                                                cornerRadius: 10.0,
                                                                corners: position.corners)
            self.dataStackViewBackground = dataStackViewBackground
            dataStackView.insertSubview(dataStackViewBackground, at: 0)
            
            switch self.position.rowPosition {
            case .top:
                topMarginConstraint.constant = 10
                bottomMarginConstraint.constant = 1
            case .bottom:
                topMarginConstraint.constant = 1
                bottomMarginConstraint.constant = 10
            case .middle,
                 .none:
                topMarginConstraint.constant = 0
                bottomMarginConstraint.constant = 0
            case .singleElement:
                topMarginConstraint.constant = 10
                bottomMarginConstraint.constant = 10
            }
        }
    }
    
    var dataStackViewBackground: UIView?
    
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
    
    override func prepareForReuse() {
        super.prepareForReuse()
        dataStackView.subviews.forEach { subview in
            dataStackViewBackground?.removeFromSuperview()
        }
    }
    
    func setEvent(_ event: TimelineEventProtocol, position: EventTimelinePosition) {
        self.event = event
        self.position = position
    }
}
