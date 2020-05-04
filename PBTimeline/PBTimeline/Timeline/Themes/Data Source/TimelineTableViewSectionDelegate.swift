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
    var eventsByDate: [(key: String, value: [TimelineEventProtocol])] {
        switch theme {
        case .regular(let direction):
            return events.sortedByDateInSections(direction: direction)
        case .minimal(let direction):
            return events.sortedByDateInSections(direction: direction)
        case .compact(let direction, _):
            return events.sortedByDateInSections(direction: direction)
        }
    }
    var customData: TimelineCustomDataProtocol?
    
    weak var timelineTableViewDelegate: TimelineTableViewDelegate?

    override init() {
        super.init()
    }
    
    init(events: [TimelineEventProtocol], theme: TimelineTheme, customData: TimelineCustomDataProtocol? = nil, delegate: TimelineTableViewDelegate?) {
        self.theme = theme
        self.events = events
        self.customData = customData
        self.timelineTableViewDelegate = delegate
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        switch theme {
        case .regular:
            break
        case .minimal:
            break
        case .compact(_, let needsHeader):
            guard needsHeader else {
                return nil
            }
        }
        
        let headerView = tableView.dequeueCellForHeader(cellType: theme.headerCellType)
        if let headerView = headerView as? TimelineHeaderViewProtocol,
            let eventsOfSection = eventsByDate[safe: section],
            let date = eventsOfSection.value[safe: 0]?.startDate {
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
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        let heightInPixelsPerSecond: CGFloat = 1 / 60
        let defaultHeight: CGFloat = 100

        if let event: TimelineEventProtocol = eventsByDate[safe: indexPath.section]?.value[safe: indexPath.row] {
            let intervalDuration = CGFloat(event.intervalDurationInSeconds)
            let height = max(intervalDuration * heightInPixelsPerSecond, defaultHeight)
            return height
        }
        return 0.0
    }
    
    func getIntervalDuration(inMinutes event: TimelineEvent) -> TimeInterval {
        let startDate = event.startDate
        let endDate = event.endDate
        
        let timeInterval = endDate.timeIntervalSince(startDate)
        return timeInterval
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        switch theme {
        case .regular:
            return theme.headerHeight
        case .minimal:
            return theme.headerHeight
        case .compact(_, let needsHeader):
            return needsHeader ? theme.headerHeight : 0.1
        }
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
