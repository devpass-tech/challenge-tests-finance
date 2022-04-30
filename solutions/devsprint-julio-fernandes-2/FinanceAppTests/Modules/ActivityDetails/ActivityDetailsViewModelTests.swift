//
//  ActivityDetailsViewModelTests.swift
//  FinanceAppTests
//
//  Created by Julio Fernandes on 30/04/22.
//

import XCTest
@testable import FinanceApp

final class ActivityDetailsViewModelTests: XCTestCase {
    
    private let delegate = ActivityDetailsViewModelDelegateSpy()
    private let financeService = FinanceServiceProtocolMock()
    private var sut: ActivityDetailsViewModel?

    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = ActivityDetailsViewModel(financeService: financeService)
    }

    override func tearDownWithError() throws {
        sut = nil
        try super.tearDownWithError()
    }

    func test_fetchData() {
        sut?.fetchData()
        XCTAssertTrue(financeService.fetchActivityDetailsCalled)
    }
    
    func test_fetchData_should_be_called_delegate() {
        sut?.delegate = delegate
        financeService.fetchActivityDetailsToBeReturned = ActivityDetails(name: "", price: 0, category: "", time: "")
        
        sut?.fetchData()
        executeRunLoop(extratime: 0.1) //por conta do Dispatch main
        
        XCTAssertTrue(delegate.didFetchActivityDetailsCalled)
    }

}

final class ActivityDetailsViewModelDelegateSpy: ActivityDetailsViewModelDelegate {
    
    private(set) var didFetchActivityDetailsCalled = false
    func didFetchActivityDetails(_ data: ActivityDetails) {
        didFetchActivityDetailsCalled = true
    }

}

extension XCTestCase {
    func executeRunLoop(extratime: TimeInterval) {
        RunLoop.current.run(until: Date() + extratime)
    }
}
