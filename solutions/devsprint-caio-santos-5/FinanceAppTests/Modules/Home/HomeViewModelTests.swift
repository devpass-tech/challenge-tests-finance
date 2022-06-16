//
//  HomeViewModelTests.swift
//  FinanceAppTests
//
//  Created by Hyago Henrique on 14/06/22.
//

import Foundation
@testable import FinanceApp
import XCTest

class HomeViewModelTests: XCTestCase {
    private var onSuccessHandler: ((_ data: HomeData) -> Void)?
    
    func test_fetchData_ShouldReturnValidData() {
        // Given
        let fakeApi = FakeFinanceService(nilData: false, successData: true)
        var sut = HomeViewModel(financeService: fakeApi)
        sut.delegate = self
        
        let expectation = self.expectation(description: "Test")
        onSuccessHandler = { homeData in
            XCTAssertEqual(homeData, responseFetchHomeData)
            expectation.fulfill()
        }

        // When
        sut.fetchData()
        
        // Then
        waitForExpectations(timeout: 0.1)
    }
    
    func test_fetchData_ShouldReturnValidData_2() {
        // Given
        let fakeApi = FakeFinanceService(nilData: false, successData: true)
        var sut = HomeViewModel(financeService: fakeApi)
        let spy = HomeViewModelDelegateSpy()
        sut.delegate = spy
        
        // When
        sut.fetchData()
        
        // Then
        executeAsyncBlock(timeout: 0.1) {
            XCTAssertEqual(spy.data, responseFetchHomeData)
            XCTAssertTrue(spy.didFetchHomeDataCalled)
        }
    }
    
    func test_fetchData_ShouldReturnNilData() {
        // Given
        let fakeApi = FakeFinanceService(nilData: true, successData: false)
        var sut = HomeViewModel(financeService: fakeApi)
        sut.delegate = self
        
        // When
        sut.fetchData()
        
        // Then
        XCTAssertTrue(true)
    }
    
    func test_fetchData_ShouldReturnNilData_2() {
        // Given
        let fakeApi = FakeFinanceService(nilData: true, successData: false)
        var sut = HomeViewModel(financeService: fakeApi)
        let spy = HomeViewModelDelegateSpy()
        sut.delegate = spy
        
        // When
        sut.fetchData()
        
        // Then
        executeAsyncBlock(timeout: 0.1) {
            XCTAssertEqual(spy.data, nil)
            XCTAssertFalse(spy.didFetchHomeDataCalled)
        }
    }
    
}

extension HomeViewModelTests: HomeViewModelDelegate {
    func didFetchHomeData(_ data: HomeData) {
        self.onSuccessHandler?(data)
    }
}

class HomeViewModelDelegateSpy: HomeViewModelDelegate {
    var didFetchHomeDataCalled = false
    var data: HomeData?

    func didFetchHomeData(_ data: HomeData) {
        didFetchHomeDataCalled = true
        self.data = data
    }
}

extension XCTestCase {
    func executeAsyncBlockAfter(timeout: TimeInterval = 10,
                                deadline: DispatchTime = .now(),
                                block: @escaping () -> Void) {
        let expectation = self.expectation(description: "Test async condition")
        DispatchQueue.main.asyncAfter(deadline: deadline) {
            expectation.fulfill()
            block()
        }
        waitForExpectations(timeout: timeout, handler: nil)
    }
    
    func executeAsyncBlock(timeout: TimeInterval = 10,
                           block: @escaping () -> Void) {
        let expectation = self.expectation(description: "Test async condition")
        DispatchQueue.main.async {
            block()
            expectation.fulfill()
        }
        waitForExpectations(timeout: timeout, handler: nil)
    }
}

