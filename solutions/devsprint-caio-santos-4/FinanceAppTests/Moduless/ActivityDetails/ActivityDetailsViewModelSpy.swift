//
//  ActivityDetailsViewModelSpy.swift
//  FinanceAppTests
//
//  Created by Anderson Oliveira on 13/06/22.
//

import Foundation
@testable import FinanceApp

class ActivityDetailsViewModelSpy: ActivityDetailsProtocol {
    
    var financeService: FinanceServiceProtocol
    var didFetchActivityDetailsWasCalled = false
    
    init(financeService: FinanceServiceProtocol) {
        self.financeService = financeService
    }
    
    func fetchData() {
        didFetchActivityDetailsWasCalled = true
    }
  
}
