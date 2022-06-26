//
//  HomeViewModelDelegateSpy.swift
//  FinanceApp
//
//  Created by Leonardo Cunha on 25/06/22.
//

import Foundation

final class HomeViewModelDelegateSpy: HomeViewModelDelegate {
    private(set) var dataPassed: HomeData?
    private(set) var didFetchHomeDataCalled: Bool = false
    private(set) var didFetchHomeDataCallCount: Int = 0
    
    func didFetchHomeData(_ data: HomeData) {
        didFetchHomeDataCalled = true
        didFetchHomeDataCallCount += 1
        self.dataPassed = data
    }
}
