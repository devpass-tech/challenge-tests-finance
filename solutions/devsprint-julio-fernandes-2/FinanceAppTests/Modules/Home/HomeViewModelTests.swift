//
//  HomeViewModelTests.swift
//  FinanceAppTests
//
//  Created by Julio Fernandes on 30/04/22.
//

import XCTest
@testable import FinanceApp

final class HomeViewModelTests: XCTestCase {
    
    private let delegate = HomeViewModelDelegateSpy()
    private let financeService = FinanceServiceProtocolMock()
    var sut: HomeViewModel?

    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = HomeViewModel(financeService: financeService)
    }

    override func tearDownWithError() throws {
        sut = nil
        try super.tearDownWithError()
    }

    func test_fetchData() {
        sut?.fetchData()
        XCTAssertTrue(financeService.fetchHomeDataCalled)
    }
    
    func test_fetchData_should_be_called_delegate() {
        sut?.delegate = delegate
        financeService.fetchHomeDataToBeReturned = HomeData(balance: 0, savings: 0, spending: 0, activity: [])
        
        sut?.fetchData()
        executeRunLoop(extratime: 0.1) //por conta do Dispatch main
        
        XCTAssertTrue(delegate.didFetchHomeDataCalled)
    }

}

final class HomeViewModelDelegateSpy: HomeViewModelDelegate {
    
    private(set) var didFetchHomeDataCalled = false
    func didFetchHomeData(_ data: HomeData) {
        didFetchHomeDataCalled = true
    }
    
}
