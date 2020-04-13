//
//  TimelineTableViewController.swift
//  PBTimeline
//
//  Created by Pablo Blanco González on 09/02/2020.
//  Copyright © 2020 Pablo Blanco. All rights reserved.
//

import UIKit
import PBTimeline

class TimelineTableViewController: UIViewController {

    @IBOutlet weak var summaryView: SummaryView!
    @IBOutlet weak var todaySummaryView: SummaryView!
    @IBOutlet weak var timelineTableView: TimelineTableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .background
        timelineTableView.setup(events: events,
                                theme: timelineTheme,
                                customData: customData,
                                delegate: self)
        
        summaryView.setup(summaryViewData: SummaryViewData(ringProgress: 0.25,
                                                           ringColor: UIColor(red: 248, green: 45, blue: 117),
                                                           titleText: "You are doing it right!",
                                                           descriptionText: "You saved a lot of money, you can spend 50€ per day till finish",
                                                           progressTrendImage: nil))
        
        todaySummaryView.setup(summaryViewData: SummaryViewData(ringProgress: 0.66,
                                                                ringColor: UIColor(red: 217, green: 253, blue: 100),
                                                                titleText: "You are doing it right!",
                                                                descriptionText: "You saved a lot of money, you can spend 50€ per day till finish",
                                                                progressTrendImage: nil))
    }
    
    var timelineTheme: TimelineTheme = .regular(direction: .upBottom)
    var events: [TimelineEvent] = []
    var customData: TimelineCustomDataProtocol?
    
    init(timelineTheme: TimelineTheme, events: [TimelineEvent], customData: TimelineCustomDataProtocol? = nil) {
        self.timelineTheme = timelineTheme
        self.events = events
        self.customData = customData
        super.init(nibName: nil, bundle: nil)
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}

extension TimelineTableViewController: TimelineTableViewDelegate {
    func didSelect(event: TimelineEventProtocol) {
        print("didSelect")
    }
}
