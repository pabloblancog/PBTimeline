//
//  TimelineTabViewController.swift
//  PBTimeline
//
//  Created by Pablo Blanco González on 25/02/2020.
//  Copyright © 2020 Pablo Blanco. All rights reserved.
//

import UIKit
import PBTimeline

class TimelineTabViewController: UITabBarController, UITabBarControllerDelegate {
    
    var events: [TimelineEvent] {
        do {
        return [TimelineEvent(id: 1,
                              date: Date(),
                              title: "New York Burguer",
                              description: "Description for event 1",
                              category: TimelineEventCategory.transport,
                              price: 10.0),
                
                TimelineEvent(id: 2,
                              date: try Date().addingDays(days: 1),
                              title: "Domino's Pizza",
                              description: "Description for event 2",
                              category: TimelineEventCategory.food,
                              price: 15.50),
                
                TimelineEvent(id: 3,
                              date: try Date().addingDays(days: 1),
                              title: "Starbucks",
                              description: "Description for event 3. This is a very long description to test what happens if a long line is included on the cell... Will it get higher?",
                              category: TimelineEventCategory.home,
                              price: 6.30),
                
                TimelineEvent(id: 4,
                              date: try Date().addingDays(days: 2),
                              title: "Pizza Hut",
                              description: "Description for event 4",
                              category: TimelineEventCategory.food,
                              price: 17.99),
                
                TimelineEvent(id: 5,
                              date: try Date().addingDays(days: 2),
                              title: "Espresso",
                              description: "Description for event 5",
                              category: TimelineEventCategory.home,
                              price: 1.10),
                
                TimelineEvent(id: 6,
                              date: try Date().addingDays(days: 2),
                              title: "Michael's burguer",
                              description: "Description for event 6",
                              category: TimelineEventCategory.transport,
                              price: 12.0),
                
                TimelineEvent(id: 7,
                              date: try Date().addingDays(days: 3),
                              title: "McDonald's",
                              description: "Description for event 7",
                              category: TimelineEventCategory.transport,
                              price: 7.99),
                
                TimelineEvent(id: 8,
                              date: try Date().addingDays(days: 3),
                              title: "Coffee house",
                              description: "Description for event 8",
                              category: TimelineEventCategory.home,
                              price: 1.60),
                
                TimelineEvent(id: 9,
                              date: try Date().addingDays(days: 4),
                              title: "Pizza garden",
                              description: "Description for event 9",
                              category: TimelineEventCategory.food,
                              price: 24.60)]
        } catch {
            return []
        }
    }
    
    var deliveryEvents: [TimelineEvent] {
        do {
            return [TimelineEvent(id: 1,
                                  date: Date(),
                                  title: TimelineProgressCategory.new.name,
                                  description: "08:30h",
                                  category: TimelineProgressCategory.new),
                    
                    TimelineEvent(id: 2,
                                  date: try Date().addingDays(days: 1),
                                  title: TimelineProgressCategory.collected.name,
                                  description: "09:30h",
                                  category: TimelineProgressCategory.collected),
                    
                    TimelineEvent(id: 3,
                                  date: try Date().addingDays(days: 1),
                                  title: TimelineProgressCategory.intransit.name,
                                  description: "09:45h",
                                  category: TimelineProgressCategory.intransit),
                    
                    TimelineEvent(id: 4,
                                  date: try Date().addingDays(days: 2),
                                  title: TimelineProgressCategory.delivered.name,
                                  description: "11:20h",
                                  category: TimelineProgressCategory.delivered)]
        } catch {
            return []
        }
    }
    var timeTrackingEvents: [TimelineEvent] {
        return [TimelineEvent(id: 1,
                              date: Date(),
                              title: "Workday start",
                              description: "08:30h",
                              category: TimelineTimeTrackingCategory.work_start),
                
                TimelineEvent(id: 2,
                              date: Date(),
                              title: "Coffee break",
                              description: "09:35h",
                              category: TimelineTimeTrackingCategory.coffee),
                
                TimelineEvent(id: 3,
                              date: Date(),
                              title: "Work",
                              description: "09:45h",
                              category: TimelineTimeTrackingCategory.work),
                
                TimelineEvent(id: 4,
                              date: Date(),
                              title: "Lunch",
                              description: "13.35h",
                              category: TimelineTimeTrackingCategory.lunch),
                
                TimelineEvent(id: 5,
                              date: Date(),
                              title: "Work",
                              description: "14:30h",
                              category: TimelineTimeTrackingCategory.work),
                
                TimelineEvent(id: 6,
                              date: Date(),
                              title: "Office > Banco Santander",
                              description: "14.35h",
                              category: TimelineTimeTrackingCategory.location_change),
                
                TimelineEvent(id: 7,
                              date: Date(),
                              title: "Work day end",
                              description: "17:30h",
                              category: TimelineTimeTrackingCategory.work_end)]
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.setRightBarButton(UIBarButtonItem(title: "New event",
                                                              style: .plain,
                                                              target: self,
                                                              action: #selector(createNewEvent(sender:))),
                                              animated: true)
        
        
        self.delegate = self
        
        let spendingData = SpendingData()
        
        let timelineSpendingsVC = TimelineTableViewController(timelineTheme: .spendings(direction: .bottomUp), events: events, customData: spendingData)
        let timelineMinimalVC = TimelineTableViewController(timelineTheme: .minimal(direction: .bottomUp), events: events)
        let timelineRegularVC = TimelineTableViewController(timelineTheme: .regular(direction: .bottomUp), events: events)
        let timelineDeliveryVC = TimelineTableViewController(timelineTheme: .regular(direction: .upBottom), events: deliveryEvents)
        let timelineTimeTrackingVC = TimelineTableViewController(timelineTheme: .regular(direction: .upBottom), events: timeTrackingEvents)
        
        timelineSpendingsVC.tabBarItem = UITabBarItem(title: "Spendings", image: nil, selectedImage: nil)
        timelineMinimalVC.tabBarItem = UITabBarItem(title: "Minimal", image: nil, selectedImage: nil)
        timelineRegularVC.tabBarItem = UITabBarItem(title: "Regular", image: nil, selectedImage: nil)
        timelineDeliveryVC.tabBarItem = UITabBarItem(title: "Delivery", image: nil, selectedImage: nil)
        timelineTimeTrackingVC.tabBarItem = UITabBarItem(title: "Time tracking", image: nil, selectedImage: nil)
        
        self.viewControllers = [timelineSpendingsVC, timelineMinimalVC, timelineRegularVC, timelineDeliveryVC, timelineTimeTrackingVC]
    }
    
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        print("tabbar")
    }
    
    
    @objc func createNewEvent(sender: UIBarButtonItem) {
        self.present(NewEventViewController.loadFromNib(), animated: true, completion: nil)
    }
}
