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
    
    var sut: ActivityDetailsViewModel?
    var isActivityDetailsViewModeldelegateCalled = false
    
    func test_whenCallFetchData_itShouldReturnADelegateCall() {
        let financeService = FinanceService(networkClient: MockNetworkingClient())
        self.sut = ActivityDetailsViewModel(financeService: financeService)
        sut?.delegate = self
        sut?.fetchData()
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


