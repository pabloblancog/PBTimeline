//
//  RingProgressView+Utils.swift
//  PBTimeline
//
//  Created by Pablo Blanco González on 22/03/2020.
//  Copyright © 2020 Pablo Blanco. All rights reserved.
//

import Foundation
import MKRingProgressView

public extension RingProgressView {
    
    convenience init(ringProgress: Double) {
        self.init()
        setup()
        setProgress(ringProgress: ringProgress)
    }
    
    static let defaultColor = UIColor(red: 6, green: 216, blue: 255)
    
    func setup(color: UIColor = RingProgressView.defaultColor) {
        startColor = color
        endColor = color
        ringWidth = 5
        shadowOpacity = 0.25
    }
    
    func setProgress(ringProgress: Double) {
        progress = ringProgress
    }

    enum RingProgressTrend {
        case up(Double)
        case down(Double)
        case same(Double)
    }
}
