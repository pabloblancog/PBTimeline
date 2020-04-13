//
//  SummaryView.swift
//  PBTimeline
//
//  Created by Pablo Blanco González on 16/03/2020.
//  Copyright © 2020 Pablo Blanco. All rights reserved.
//

import UIKit
import MKRingProgressView

struct SummaryViewData {
    var ringProgress: Double
    var ringColor: UIColor
    var titleText: String
    var descriptionText: String?
    var progressTrendImage: UIImage?
}

class SummaryView: UIView {

    @IBOutlet weak var containerView: UIView! {
        didSet {
            containerView.addShadow(color: .black)
            containerView.setCorners(cornerRadius: 10)
        }
    }

    @IBOutlet weak var progressRingContainerView: UIView! {
        didSet {
            
            let width = progressRingContainerView.width
            let height = progressRingContainerView.height

            ringProgressView = RingProgressView(frame: CGRect(x: 0, y: 0, width: width, height: height))
            ringProgressView.setup()
            
            progressRingContainerView.addSubview(ringProgressView, width: width, height: height)
        }
    }
    
    @IBOutlet weak var titleLabel: UILabel! {
        didSet {
            titleLabel.font = UIFont.systemFont(ofSize: 16,
                                                weight: .regular)
        }
    }
    
    @IBOutlet weak var descriptionLabel: UILabel! {
        didSet {
            descriptionLabel.font = UIFont.systemFont(ofSize: 14,
                                                      weight: .light)
            descriptionLabel.textColor = UIColor.gray

        }
    }
    
    var ringProgressView: RingProgressView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    func commonInit() {
        backgroundColor = .clear
        loadNibContent()
    }
    
    func setup(summaryViewData: SummaryViewData) {
        ringProgressView.startColor = summaryViewData.ringColor
        ringProgressView.endColor = summaryViewData.ringColor
        ringProgressView.setProgress(ringProgress: summaryViewData.ringProgress)
        titleLabel.text = summaryViewData.titleText
        descriptionLabel.text = summaryViewData.descriptionText
        
        //summaryViewData.progressTrendImage
    }
}
