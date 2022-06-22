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
    
    private lazy var sut: ActivityDetailsViewModel = {
        ActivityDetailsViewModel(financeService: self.financeService)
    }()
    
    private lazy var activityDetailsViewModelDelegateSpy: ActivityDetailsViewModelDelegateSpy = {
        ActivityDetailsViewModelDelegateSpy()
    }()
    
    private let financeService = FinanceService(networkClient: NetworkingClientMock())
    
    func test_whenCallFetchData_itShouldReturnADelegateCall() {
        sut.delegate = activityDetailsViewModelDelegateSpy
        sut.fetchData()
        let expec = expectation(description: "")
        DispatchQueue.main.async {
            expec.fulfill()
        }
        wait(for: [expec], timeout: 1)
        XCTAssertTrue(self.activityDetailsViewModelDelegateSpy.isActivityDetailsViewModeldelegateCalled)
    }
    
    func test_whenCallFetchData_itShouldReturnADelegateCallWithActivityDetails() {
        sut.delegate = activityDetailsViewModelDelegateSpy
        sut.fetchData()
        let expec = expectation(description: "")
        DispatchQueue.main.async {
            expec.fulfill()
        }
        wait(for: [expec], timeout: 1)
        XCTAssertNotNil(self.activityDetailsViewModelDelegateSpy.data)
    }
    
}

