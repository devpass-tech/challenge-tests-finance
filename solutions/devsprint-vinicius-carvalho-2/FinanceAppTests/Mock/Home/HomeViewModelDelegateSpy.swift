//
//  HomeViewModelDelegateSpy.swift
//  FinanceAppTests
//
//  Created by vinicius.carvalho on 11/04/22.
//

import Foundation

@testable import FinanceApp

class HomeViewModelDelegateSpy: HomeViewModelDelegate {

    var displayHomeData = false

    func didFetchHomeData(_ data: HomeData) {
        displayHomeData = true
    }
}
