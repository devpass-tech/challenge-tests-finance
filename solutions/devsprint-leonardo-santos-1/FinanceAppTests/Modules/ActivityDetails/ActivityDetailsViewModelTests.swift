//
//  ActivityDetailsViewModelTests.swift
//  FinanceAppTests
//
//  Created by Hoff Silva on 2022-06-20.
//

import Foundation
import XCTest

@testable import FinanceApp

extension HomeData {
    static func fixture() -> Self {
        HomeData(balance: 0, savings: 0, spending: 0, activity: [])
    }
}

final class ActivityDetailsViewModelTests: XCTestCase {
    
    var sut: ActivityDetailsViewModel?
    private lazy var activityDetailsViewModelDelegateSpy: ActivityDetailsViewModelDelegateSpy = {
        ActivityDetailsViewModelDelegateSpy()
    }()
    let financeService = FinanceService(networkClient: NetworkingClientMock())
    
    func test_whenCallFetchData_itShouldReturnADelegateCall() {
        self.sut = ActivityDetailsViewModel(financeService: financeService)
        sut?.delegate = activityDetailsViewModelDelegateSpy
        sut?.fetchData()
        let expec = expectation(description: "")
        DispatchQueue.main.async {
            expec.fulfill()
        }
        wait(for: [expec], timeout: 1)
        XCTAssertTrue(self.activityDetailsViewModelDelegateSpy.isActivityDetailsViewModeldelegateCalled)
    }
    
    func test_whenCallFetchData_itShouldReturnADelegateCallWithActivityDetails() {
        self.sut = ActivityDetailsViewModel(financeService: financeService)
        sut?.delegate = activityDetailsViewModelDelegateSpy
        sut?.fetchData()
        let expec = expectation(description: "")
        DispatchQueue.main.async {
            expec.fulfill()
        }
        wait(for: [expec], timeout: 1)
        XCTAssertNotNil(self.activityDetailsViewModelDelegateSpy.data)
    }
    
}

