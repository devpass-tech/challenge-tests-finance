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
    func test_whenCallFetchData_ShouldCallDidFetchActivityDetailsMethod() {
        
        let sut = ActivityDetailsViewModelSpy(financeService: ServiceMockForActivityDetails())
        sut.fetchData()
        XCTAssertTrue(sut.didFetchActivityDetailsWasCalled)
    }
}
