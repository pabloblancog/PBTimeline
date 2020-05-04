//
//  TimelineTheme.swift
//  PBTimeline
//
//  Created by Pablo Blanco González on 14/03/2020.
//  Copyright © 2020 Pablo Blanco. All rights reserved.
//

import UIKit

public enum TimelineDirection {
    case upBottom
    case bottomUp
}

public enum TimelineTheme {
    case regular(direction: TimelineDirection)
    case minimal(direction: TimelineDirection)
    case compact(direction: TimelineDirection, needsHeaders: Bool)
    
    var cellType: UITableViewCell.Type {
        let cellClass: UITableViewCell.Type
        switch self {
        case .regular:
            cellClass = TimelineRegularTableViewCell.self
        case .minimal:
            cellClass = TimelineMinimalTableViewCell.self
        case .compact:
            cellClass = TimelineCompactTableViewCell.self
        }
        return cellClass
    }
    
    var headerCellType: UITableViewHeaderFooterView.Type {
        let cellClass: UITableViewHeaderFooterView.Type
        switch self {
        case .regular:
            cellClass = TimelineRegularHeaderView.self
        case .minimal:
            cellClass = TimelineMinimalHeaderView.self
        case .compact:
            cellClass = TimelineCompactHeaderView.self
        }
        return cellClass
    }

    var headerHeight: CGFloat {
        switch self {
        case .regular:
            return 40
        case .minimal:
            return 40
        case .compact:
            return 56
        }
    }
    
    var footerHeight: CGFloat {
        switch self {
        case .regular:
            return 0.1
        case .minimal:
            return 0.1
        case .compact:
            return 0.1
        }
    }
}
