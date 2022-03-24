//
//  HomeViewModelDelegateMock.swift
//  FinanceAppTests
//
//  Created by Murillo R. Araújo on 18/03/22.
//

import Foundation
@testable import FinanceApp

class HomeViewModelDelegateMock: HomeViewModelDelegate {

    var displayedHomeData = false
    var displayedError = false

    func didFetchHomeData(_ data: HomeData) {
        displayedHomeData = true
    }
}
