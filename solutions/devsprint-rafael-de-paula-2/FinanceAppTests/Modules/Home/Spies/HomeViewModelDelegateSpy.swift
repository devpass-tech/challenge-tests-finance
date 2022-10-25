//
//  HomeViewModelDelegateSpy.swift
//  FinanceAppTests
//
//  Created by Rafael de Paula on 25/10/22.
//

import Foundation
@testable import FinanceApp

final class HomeViewModelDelegateSpy: HomeViewModelDelegate {
    
    private(set) var didFetchHomeDataCalled = false
    private(set) var didFetchHomeDataPassed: HomeData?
    
    func didFetchHomeData(_ data: HomeData) {
        didFetchHomeDataCalled = true
        didFetchHomeDataPassed = data
    }
}
