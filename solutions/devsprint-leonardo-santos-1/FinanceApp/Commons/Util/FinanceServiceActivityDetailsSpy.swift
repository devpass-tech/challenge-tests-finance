//
//  FinanceServiceActivityDetailsSpy.swift
//  FinanceApp
//
//  Created by Leonardo Cunha on 25/06/22.
//

import Foundation

final class FinanceServiceActivityDetailsSpy: FinanceServiceActivityDetailsProtocol {
    private(set) var fetchActivityDetailsCalled: Bool = false
    private(set) var fetchActivityDetailsCalledCount: Int = 0
    var activityDetailsDataToBeReturned: ActivityDetails?
    
    
    func fetchActivityDetails(_ completion: @escaping (ActivityDetails?) -> Void) {
        fetchActivityDetailsCalled = true
        fetchActivityDetailsCalledCount += 1
        completion(activityDetailsDataToBeReturned)
    }
}
