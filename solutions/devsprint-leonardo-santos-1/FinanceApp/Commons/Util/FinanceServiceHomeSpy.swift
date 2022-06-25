//
//  FinanceServiceHomeSpy.swift
//  FinanceApp
//
//  Created by Leonardo Cunha on 25/06/22.
//

import Foundation

final class FinanceServiceHomeSpy: FinanceServiceHomeProtocol {
    private(set) var fetchHomeDataCalled: Bool = false
    private(set) var fetchHomeDataCalledCount: Int = 0
    var homeDataToBeReturned: HomeData?
    
    func fetchHomeData(_ completion: @escaping (HomeData?) -> Void) {
        fetchHomeDataCalled = true
        fetchHomeDataCalledCount += 1
        completion(homeDataToBeReturned)
    }
}
