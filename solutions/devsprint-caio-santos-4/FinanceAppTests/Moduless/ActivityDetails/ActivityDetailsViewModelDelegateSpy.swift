//
//  ActivityDetailsViewModelDelegateSpy.swift
//  FinanceAppTests
//
//  Created by Anderson Oliveira on 14/06/22.
//

import Foundation
@testable import FinanceApp

class ActivityDetailsViewModelDelegateSpy: ActivityDetailsViewModelDelegate {
    
    var didFetchActivityDetailsWasCalled: Bool = false

    func didFetchActivityDetails(_ data: ActivityDetails) {
        didFetchActivityDetailsWasCalled = true
    }
}
