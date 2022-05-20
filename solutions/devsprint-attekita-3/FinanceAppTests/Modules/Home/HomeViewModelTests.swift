//
//  HomeViewModelTests.swift
//  FinanceAppTests
//
//  Created by Matheus Góes on 19/05/22.
//

import XCTest
@testable import FinanceApp

class HomeViewModelTests: XCTestCase {
    private var sut: HomeViewModel!
    private var financeService: FinanceService!
    private let networkClientMock = NetworkClientMock()
    private var didFetchHomeDataCalled = false
    private var expectations: XCTestExpectation? = nil
    private var financeServiceSpy: FinanceServiceSpy!

    override func setUp() {
        financeService = FinanceService(networkClient: self.networkClientMock)
        sut = HomeViewModel(financeService: self.financeService)
    }

    override func tearDown() {
        sut = nil
        financeService = nil
    }
    
    func testHomeViewModel_WhenFetchDataMethodCalled_ShouldCallDidFetchHomeDataDelegateMethod() {
        sut.delegate = self
        expectations = self.expectation(description: "when fetchData method is executed should call didFetchHomeData delegate method")
        
        sut.fetchData()
        
        self.waitForExpectations(timeout: 3.0)
        
        XCTAssertTrue(self.didFetchHomeDataCalled, "fails because the fetchData method does not call the didFetchData delegate method")
    }
    
    func testHomeViewModel_WhenFetchHomeDataMethodCalled_ShouldReturnTrue() {
        financeServiceSpy = FinanceServiceSpy()
        sut = HomeViewModel(financeService: self.financeServiceSpy)
        
        sut.fetchData()
        
        XCTAssertTrue(financeServiceSpy.fetchHomeDataWasCalled)
    }
}

extension HomeViewModelTests: HomeViewModelDelegate {
    func didFetchHomeData(_ data: HomeData) {
        self.didFetchHomeDataCalled = true
        self.expectations?.fulfill()
    }
}
