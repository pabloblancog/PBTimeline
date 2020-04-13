//
//  TimelineTableViewSectionDataSource.swift
//  PBTimeline
//
//  Created by Pablo Blanco González on 09/02/2020.
//  Copyright © 2020 Pablo Blanco. All rights reserved.
//

import UIKit

class TimelineTableViewSectionDataSource: NSObject, TimelineTableViewDataSourceProtocol {
    
    var events: [TimelineEventProtocol] = []
    var theme: TimelineTheme = .regular(direction: .upBottom)
    
    var eventsByDate: [(key: String, value: [TimelineEventProtocol])] = []
    
    override init() {
        super.init()
    }
    
    init(events: [TimelineEventProtocol], theme: TimelineTheme) {
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
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return eventsByDate.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let eventsOfSection = eventsByDate[safe: section] {
            return eventsOfSection.value.count
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueCell(cellType: theme.cellType, indexPath: indexPath)
        if let cell = cell as? TimelineCellProtocol,
            let event = eventsByDate[safe: indexPath.section]?.value[safe: indexPath.row] {
            let position = getPosition(section: indexPath.section, row: indexPath.row)
            cell.setEvent(event, position: position)
        }
        return cell
    }
}

extension TimelineTableViewSectionDataSource {
    
    func getPosition(section: Int, row: Int) -> EventTimelinePosition {
        
        let rowPosition = getRowPosition(row, inSection: section)
        let sectionPosition = getSectionPosition(section: section)
        return EventTimelinePosition(rowPosition: rowPosition, sectionPosition: sectionPosition)
    }
    
    func getSectionPosition(section: Int) -> TimelinePosition {
        guard eventsByDate.count > 1 else {
            return .singleElement
        }
        
        switch section {
        case eventsByDate.count-1:
            return .bottom
        case 0:
            return .top
        default:
            return .middle
        }
    }
    
    func getRowPosition(_ row: Int, inSection section: Int) -> TimelinePosition {
        guard let eventsOfSection = eventsByDate[safe: section] else {
            return .none
        }
        guard eventsOfSection.value.count > 1 else {
            return .singleElement
        }

        switch row {
        case eventsOfSection.value.count-1:
            return .bottom
        case 0:
            return .top
        default:
            return .middle
        }
    }
}
