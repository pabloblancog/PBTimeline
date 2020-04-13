//
//  TimelineTableView.swift
//  PBTimeline
//
//  Created by Pablo Blanco González on 08/02/2020.
//  Copyright © 2020 Pablo Blanco. All rights reserved.
//

import UIKit
import PBUtils

public protocol TimelineTableViewDelegate: class {
    func didSelect(event: TimelineEventProtocol)
}

public class TimelineTableView: UITableView {
        
    private var timelineDataSource: TimelineTableViewSectionDataSource?
    private var timelineDelegate: TimelineTableViewSectionDelegate?
    
    public override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
        commonInit()
    }
    
    public required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    private func commonInit() {
        rowHeight = UITableView.automaticDimension
        estimatedRowHeight = 50
        separatorStyle = .none
        backgroundColor = .background
    }
    
    public func setup(events: [TimelineEventProtocol], theme: TimelineTheme, customData: TimelineCustomDataProtocol? = nil, delegate: TimelineTableViewDelegate?) {
        registerCells(theme: theme)
        setDataSources(events: events, theme: theme, customData: customData, delegate: delegate)
    }
    
    private func registerCells(theme: TimelineTheme) {
        switch theme {
        case .regular:
            register(cellIdentifier: TimelineRegularTableViewCell.defaultReuseIdentifier)
            register(forHeaderFooterViewReuseIdentifier: TimelineRegularHeaderView.defaultReuseIdentifier)
        case .minimal:
            register(cellIdentifier: TimelineMinimalTableViewCell.defaultReuseIdentifier)
            register(forHeaderFooterViewReuseIdentifier: TimelineMinimalHeaderView.defaultReuseIdentifier)
        case .spendings:
            register(cellIdentifier: TimelineSpendingsTableViewCell.defaultReuseIdentifier)
            register(forHeaderFooterViewReuseIdentifier: TimelineSpendingsHeaderView.defaultReuseIdentifier)
        }
    }
    
    
    private func setDataSources(events: [TimelineEventProtocol], theme: TimelineTheme, customData: TimelineCustomDataProtocol? = nil, delegate: TimelineTableViewDelegate?) {
        self.timelineDataSource = TimelineTableViewSectionDataSource(events: events, theme: theme)
        self.timelineDelegate = TimelineTableViewSectionDelegate(events: events, theme: theme, customData: customData, delegate: delegate)
        
        self.dataSource = self.timelineDataSource
        self.delegate = self.timelineDelegate
    }
}
