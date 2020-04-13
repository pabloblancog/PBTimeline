//
//  SpendingData.swift
//  PBTimeline
//
//  Created by Pablo Blanco González on 12/04/2020.
//  Copyright © 2020 PabloBlanco. All rights reserved.
//

import Foundation

public struct SpendingData: TimelineCustomDataProtocol {
    
    public init() {}
    
    public func data(forDateHash dateHashString: String) -> Any? {
        return spendingData[dateHashString]
    }
    
    var spendingData: [String?: Double] { return [Date().dateHashString: spendingProgress(forSpending: 15),
                                                  Date().addingDays(days: 1)!.dateHashString: spendingProgress(forSpending: 40),
                                                  Date().addingDays(days: 2)!.dateHashString: spendingProgress(forSpending: 35),
                                                  Date().addingDays(days: 3)!.dateHashString: spendingProgress(forSpending: 10),
                                                  Date().addingDays(days: 4)!.dateHashString: spendingProgress(forSpending: 20)]
    }
    
    static let totalSpendingPerDay: Double = 50
    func spendingProgress(forSpending spending: Double) -> Double {
        return spending / SpendingData.totalSpendingPerDay
    }
}
