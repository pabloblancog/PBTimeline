//
//  SectionDelegate.swift
//  PBTimeline
//
//  Created by Pablo Blanco González on 09/02/2020.
//  Copyright © 2020 Pablo Blanco. All rights reserved.
//

import UIKit

public protocol TimelineCustomDataProtocol {
    func data(forDateHash dateHashString: String) -> Any?
}

class TimelineTableViewSectionDelegate: NSObject, UITableViewDelegate {
    
    var theme: TimelineTheme = .regular(direction: .upBottom)
    var events: [TimelineEventProtocol] = []
    var eventsByDate: [(key: String, value: [TimelineEventProtocol])] = []
    var customData: TimelineCustomDataProtocol?
    
    weak var timelineTableViewDelegate: TimelineTableViewDelegate?

    override init() {
        super.init()
    }
    
    init(events: [TimelineEventProtocol], theme: TimelineTheme, customData: TimelineCustomDataProtocol? = nil, delegate: TimelineTableViewDelegate?) {
        self.theme = theme
        self.events = events
        
        switch theme {
        case .regular(let direction):
            self.eventsByDate = events.sortedByDateInSections(direction: direction)
        case .minimal(let direction):
            self.eventsByDate = events.sortedByDateInSections(direction: direction)
        case .spendings(let direction):
            self.eventsByDate = events.sortedByDateInSections(direction: direction)
        }
        self.customData = customData
        self.timelineTableViewDelegate = delegate
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = tableView.dequeueCellForHeader(cellType: theme.headerCellType)
        if let headerView = headerView as? TimelineHeaderViewProtocol,
            let eventsOfSection = eventsByDate[safe: section],
            let date = eventsOfSection.value[safe: 0]?.date {
            let text = date.dateString
            
            let position: TimelinePosition
            switch section {
            case 0:
                position = .none
            default:
                position = .middle
            }
            
            headerView.setup(text: text, date: date, position: position, customData: customData)
        }
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return theme.headerHeight
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let view = UIView()
        view.backgroundColor = .clear
        return view
    }

    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return theme.footerHeight
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let events = eventsByDate[safe: indexPath.section],
            let event = events.value[safe: indexPath.row] {
            timelineTableViewDelegate?.didSelect(event: event)
        }
    }
}
