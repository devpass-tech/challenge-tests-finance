//
//  HomeViewModelTests.swift
//  FinanceAppTests
//
//  Created by Rodrigo Borges on 13/09/22.
//

import XCTest
@testable import FinanceApp

class HomeViewModelTests: XCTestCase {
    private let serviceSpy = FinanceServiceSpy()
    private let delegateSpy = HomeViewModelDelegateSpy()
    private let dispatchQueueSpy = DispatchQueueSpy()
    
    private lazy var sut: HomeViewModel = {
        var viewModel = HomeViewModel(
            financeService: serviceSpy,
            dispatchQueue: dispatchQueueSpy
        )
        viewModel.delegate = delegateSpy
        return viewModel
    }()
    
    func test_fetchData_whenDataReturnsNil_shouldCallNotDelegate() {
        serviceSpy.fetchHomeDataToBeReturned = nil

        sut.fetchData()
        
        XCTAssertTrue(serviceSpy.fetchHomeDataCalled)
        XCTAssertNil(serviceSpy.fetchHomeDataToBeReturned)
        XCTAssertFalse(delegateSpy.didFetchHomeDataCalled)
        XCTAssertNil(delegateSpy.didFetchHomeDataPassed)
        XCTAssertFalse(dispatchQueueSpy.calledDispatchQueueAsync)
    }
    
    func test_fetchData_whenHasValidData_shouldCallDelegate() {
        let homeData: HomeData = .fixture()
        serviceSpy.fetchHomeDataToBeReturned = .success(homeData)
        
        sut.fetchData()
        
        XCTAssertTrue(serviceSpy.fetchHomeDataCalled)
        XCTAssertTrue(serviceSpy.fetchHomeDataToBeReturned?.isSuccess == true)
        XCTAssertEqual(serviceSpy.fetchHomeDataToBeReturned?.value, homeData)
        XCTAssertTrue(delegateSpy.didFetchHomeDataCalled)
        XCTAssertEqual(delegateSpy.didFetchHomeDataPassed, homeData)
        XCTAssertTrue(dispatchQueueSpy.calledDispatchQueueAsync)
    }
}
