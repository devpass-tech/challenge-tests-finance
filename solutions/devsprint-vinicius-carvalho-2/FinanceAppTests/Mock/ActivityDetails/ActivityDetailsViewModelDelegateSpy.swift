//
//  ActivityDetailsViewModelDelegateSpy.swift
//  FinanceAppUITests
//
//  Created by vinicius.carvalho on 11/04/22.
//

import Foundation

@testable import FinanceApp

class ActivityDetailsViewModelDelegateSpy: ActivityDetailsViewModelDelegate {

    var displayedActivityDetails = false

    func didFetchActivityDetails(_ data: ActivityDetails) {
        displayedActivityDetails = true
    }
}
