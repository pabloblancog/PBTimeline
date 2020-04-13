//
//  BubbleLineView.swift
//  PBTimeline
//
//  Created by Pablo Blanco González on 16/02/2020.
//  Copyright © 2020 Pablo Blanco. All rights reserved.
//

import UIKit

class BubbleLineView: UIView {
    
    enum BubbleLineSetup {
        case top(displayBubble: Bool)
        case bottom(displayBubble: Bool)
        case full(displayBubble: Bool)
        case none(displayBubble: Bool)
        
        static func setup(fromPosition position: EventTimelinePosition) -> BubbleLineSetup {
            let sectionPosition = position.sectionPosition
            let rowPosition = position.rowPosition
            switch sectionPosition {
            case .top:
                switch rowPosition {
                case .top:
                    return .top(displayBubble: true)
                case .bottom:
                    return .bottom(displayBubble: true)
                case .middle:
                    return .full(displayBubble: true)
                case .singleElement:
                    return .top(displayBubble: true)
                case .none:
                    return .none(displayBubble: true)
                }
                
            case .bottom:
                switch rowPosition {
                case .top:
                    return .top(displayBubble: true)
                case .bottom:
                    return .bottom(displayBubble: true)
                case .middle:
                    return .full(displayBubble: true)
                case .singleElement:
                    return .bottom(displayBubble: true)
                case .none:
                    return .none(displayBubble: true)
                }
            case .middle:
                return .full(displayBubble: true)
                
            case .singleElement:
                switch rowPosition {
                case .top:
                    return .top(displayBubble: true)
                case .bottom:
                    return .bottom(displayBubble: true)
                case .middle:
                    return .full(displayBubble: true)
                case .singleElement:
                    return .bottom(displayBubble: true)
                case .none:
                    return .none(displayBubble: true)
                }
                
            case .none:
                return .none(displayBubble: false)
            }
        }
    }
    
    @IBOutlet var contentView: UIView! {
        didSet {
            contentView.backgroundColor = .background
        }
    }

    @IBOutlet weak var topLineView: UIView! {
        didSet {
            topLineView.backgroundColor = .secondary
            topLineView.addShadow(color: .primary)
        }
    }
    
    @IBOutlet weak var bottomLineView: UIView! {
        didSet {
            bottomLineView.backgroundColor = .secondary
            bottomLineView.addShadow(color: .primary)
        }
    }
    
    @IBOutlet weak var bubbleView: UIView! {
        didSet {
            bubbleView.backgroundColor = .secondary
            bubbleView.layer.cornerRadius = bubbleView.height / 2
            bubbleView.addShadow(color: .primary)
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    func commonInit() {
        loadNibContent()
    }
    
    public func setup(setup: BubbleLineSetup, bubbleType: BubbleType) {
        
        switch setup {
        case .top(let displayBubble):
            self.setup(isBubbleHidden: !displayBubble, isTopLineHidden: true, isBottomLineHidden: false, bubbleType: bubbleType)
        case .bottom(let displayBubble):
            self.setup(isBubbleHidden: !displayBubble, isTopLineHidden: false, isBottomLineHidden: true, bubbleType: bubbleType)
        case .full(let displayBubble):
            self.setup(isBubbleHidden: !displayBubble, isTopLineHidden: false, isBottomLineHidden: false, bubbleType: bubbleType)
        case .none(let displayBubble):
            self.setup(isBubbleHidden: !displayBubble, isTopLineHidden: true, isBottomLineHidden: true, bubbleType: bubbleType)
        }
    }
    
    private func setup(isBubbleHidden: Bool, isTopLineHidden: Bool, isBottomLineHidden: Bool, bubbleType: BubbleType) {
        bubbleView.isHidden = isBubbleHidden
        topLineView.isHidden = isTopLineHidden
        bottomLineView.isHidden = isBottomLineHidden
        backgroundColor = .background
        
        switch bubbleType {
        case .plain(let tintColor):
            bubbleView.backgroundColor = tintColor
        case .image(let image):
            bubbleView.addSubview(UIImageView(image: image), width: 18, height: 18)
        }
    }
}

enum BubbleType {
    case plain(tintColor: UIColor?)
    case image(image: UIImage?)
}

