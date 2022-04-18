//
//  HomeViewModelDelegateSpy.swift
//  FinanceAppTests
//
//  Created by Guilherme Strutzki on 18/04/22.
//

import Foundation

@testable import FinanceApp

class HomeViewModelDelegateSpy: HomeViewModelDelegate {
    var showHomeData = false
    
    func didFetchHomeData(_ data: HomeData) {
        showHomeData = true
    }
}
