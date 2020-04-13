//
//  TimelinePosition.swift
//  PBTimeline
//
//  Created by Pablo Blanco González on 14/03/2020.
//  Copyright © 2020 Pablo Blanco. All rights reserved.
//

import UIKit

enum TimelinePosition {
    case top
    case bottom
    case middle
    case singleElement
    case none
}

struct EventTimelinePosition {
    var rowPosition: TimelinePosition
    var sectionPosition: TimelinePosition
    
    var corners: CACornerMask {
        switch rowPosition {
        case .top:
            return [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        case .bottom:
            return [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        case .singleElement:
            return [.layerMinXMinYCorner, .layerMinXMaxYCorner, .layerMaxXMinYCorner, .layerMaxXMaxYCorner]
        case .middle,
             .none:
            return []
        }
    }
}
