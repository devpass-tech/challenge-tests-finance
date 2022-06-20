//
//  ActivityDetailsViewModelTests.swift
//  FinanceAppTests
//
//  Created by Hoff Silva on 2022-06-20.
//

import Foundation
import XCTest

@testable import FinanceApp

final class ActivityDetailsViewModelTests: XCTestCase {
    
    var financeService: FinanceServiceProtocol?
    var activityDetailsViewModel: ActivityDetailsViewModel?
    var isActivityDetailsViewModeldelegateCalled = false
    
    func test_whenCallFetchData_itShouldReturnADelegateCall() {
        self.financeService = FinanceService(networkClient: NetworkingClientDouble())
        self.activityDetailsViewModel = ActivityDetailsViewModel(financeService: self.financeService!)
        self.activityDetailsViewModel?.delegate = self
        self.activityDetailsViewModel?.fetchData()
        let expec = expectation(description: "")
        DispatchQueue.main.async {
            expec.fulfill()
        }
        wait(for: [expec], timeout: 1)
        XCTAssertTrue(self.isActivityDetailsViewModeldelegateCalled)
    }
    
}

extension ActivityDetailsViewModelTests: ActivityDetailsViewModelDelegate {
    
    func didFetchActivityDetails(_ data: ActivityDetails) {
        self.isActivityDetailsViewModeldelegateCalled = true
    }
    
}


