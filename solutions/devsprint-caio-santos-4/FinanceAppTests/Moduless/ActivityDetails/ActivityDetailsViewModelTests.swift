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
        XCTAssertTrue(activityDetailsViewModelDelegateSpy.didFetchActivityDetailsWasCalled)
    }
    
    func test_whenViewModelHasDelegateAndCallFetchDataWithInvalidJson_ShouldCallDidFetchActivityDetailsMethod() {
        sut = ActivityDetailsViewModel(financeService: ServiceMockForActivityDetails(.invalid))
        let activityDetailsViewModelDelegateSpy = ActivityDetailsViewModelDelegateSpy()
        sut.delegate = activityDetailsViewModelDelegateSpy
        sut.fetchData()
        XCTAssertFalse(activityDetailsViewModelDelegateSpy.didFetchActivityDetailsWasCalled)
    }
    
    func test_whenViewModelHasNoDelegateAndCallFetchData_shouldNotCallDidFetchActivityDetailsMethod() {
        sut = ActivityDetailsViewModel(financeService: ServiceMockForActivityDetails(.valid))
        let activityDetailsViewModelDelegateSpy = ActivityDetailsViewModelDelegateSpy()
        sut.fetchData()
        XCTAssertFalse(activityDetailsViewModelDelegateSpy.didFetchActivityDetailsWasCalled)
    }
}
