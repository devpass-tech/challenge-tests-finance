//
//  ActivityDetailsViewModelTests.swift
//  FinanceAppTests
//
//  Created by Anderson Oliveira on 13/06/22.
//

import Foundation
import XCTest
@testable import FinanceApp

class ActivityDetailsViewModelTests: XCTestCase {
    
    var sut: ActivityDetailsViewModel!
    
    override func tearDownWithError() throws {
        sut = nil
    }
    
    func test_whenVielModelHasDelegateAndCallFetchDataWithValidJson_ShouldCallDidFetchActivityDetailsMethod() {
        sut = ActivityDetailsViewModel(financeService: ServiceMockForActivityDetails(.valid))
        let activityDetailsViewModelDelegateSpy = ActivityDetailsViewModelDelegateSpy()
        sut.delegate = activityDetailsViewModelDelegateSpy
        sut.fetchData()
        let expectation = expectation(description: "async test")
        DispatchQueue.main.async {
            expectation.fulfill()
            XCTAssertTrue(activityDetailsViewModelDelegateSpy.didFetchActivityDetailsWasCalled)
        }
        waitForExpectations(timeout: 1)
    }
    
    func test_whenViewModelHasDelegateAndCallFetchDataWithInvalidJson_ShouldCallDidFetchActivityDetailsMethod() {
        sut = ActivityDetailsViewModel(financeService: ServiceMockForActivityDetails(.invalid))
        let activityDetailsViewModelDelegateSpy = ActivityDetailsViewModelDelegateSpy()
        sut.delegate = activityDetailsViewModelDelegateSpy
        sut.fetchData()
        let expectation = expectation(description: "async test")
        DispatchQueue.main.async {
            expectation.fulfill()
            XCTAssertFalse(activityDetailsViewModelDelegateSpy.didFetchActivityDetailsWasCalled)
        }
        waitForExpectations(timeout: 1)
    }
    
    func test_whenViewModelHasNoDelegateAndCallFetchData_shouldNotCallDidFetchActivityDetailsMethod() {
        sut = ActivityDetailsViewModel(financeService: ServiceMockForActivityDetails(.valid))
        let activityDetailsViewModelDelegateSpy = ActivityDetailsViewModelDelegateSpy()
        sut.fetchData()
        let expectation = expectation(description: "async test")
        DispatchQueue.main.async {
            expectation.fulfill()
            XCTAssertFalse(activityDetailsViewModelDelegateSpy.didFetchActivityDetailsWasCalled)
        }
        waitForExpectations(timeout: 1)
    }
}
