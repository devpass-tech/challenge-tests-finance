//
//  ActivityDetailsViewModelDelegateSpy.swift
//  FinanceApp
//
//  Created by Leonardo Cunha on 25/06/22.
//

import Foundation

final class ActivityDetailsViewModelDelegateSpy: ActivityDetailsViewModelDelegate {
    private(set) var dataPassed: ActivityDetails?
    private(set) var didFetchActivityDetailsCalled: Bool = false
    private(set) var didFetchActivityDetailsCallCount: Int = 0
    
    func didFetchActivityDetails(_ data: ActivityDetails) {
        didFetchActivityDetailsCalled = true
        didFetchActivityDetailsCallCount += 1
        self.dataPassed = data
    }
}
