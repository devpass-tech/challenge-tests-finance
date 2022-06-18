//
//  HomeViewModelDelegateSpy.swift
//  FinanceAppTests
//
//  Created by Isabella Bencardino on 16/06/2022.
//

import Foundation
@testable import FinanceApp

class HomeViewModelDelegateSpy: HomeViewModelDelegate {

    var fetchHomeDataWasCalled = false

    func didFetchHomeData(_ data: HomeData) {
        fetchHomeDataWasCalled = true
    }
}
