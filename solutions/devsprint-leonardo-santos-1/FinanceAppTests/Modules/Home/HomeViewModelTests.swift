//
//  HomeViewModelTests.swift
//  FinanceAppTests
//
//  Created by Leonardo Cunha on 24/06/22.
//

import XCTest
@testable import FinanceApp

final class HomeViewModelTests: XCTestCase {
    private let dispatchQueueSpy = DispatchQueueSpy()
    private let homeServiceSpy = FinanceServiceHomeDataSpy()
    private let delegateSpy = HomeViewModelDelegateSpy()
    private lazy var sut = HomeViewModel(financeService: homeServiceSpy,
                                    mainDispatchQueue: dispatchQueueSpy)
    
    func test_whenFetchDataIsCalled_whenDataIsNotNil_dispatchQueueShouldBeCalled() {
        homeServiceSpy.fetchHomeDataReturned = .fixture()
        sut.fetchData()
        
        XCTAssertTrue(dispatchQueueSpy.asyncCalled)
    }
    
    func test_whenFetchDataIsCalled_whenDataIsNotNil_dispatchQueueShouldBeCalledOnce() {
        homeServiceSpy.fetchHomeDataReturned = .fixture()
        sut.fetchData()
        
        XCTAssertEqual(dispatchQueueSpy.asyncCalledCount, 1)
    }
    
    func test_whenFetchDataIsCalled_whenDataIsNil_dispatchQueueShouldNotBeCalled() {
        homeServiceSpy.fetchHomeDataReturned = nil
        sut.fetchData()

        XCTAssertFalse(dispatchQueueSpy.asyncCalled)
    }
    
    func test_whenFetchDataIsCalled_shouldCallFetchHomeData() {
        sut.fetchData()
        
        XCTAssertTrue(homeServiceSpy.fetchHomeDataTriggered)
    }
    
    func test_whenFetchDataIsCalled_shouldCallshouldCallFetchHomeDataOnce() {
        sut.fetchData()
        
        XCTAssertEqual(homeServiceSpy.fecthHomeDataCount, 1)
    }
    
    func test_whenFetchDataIsCalled_whenReturnedDataIsNotNil_shouldCallDidFetchActivityDetails() {
        homeServiceSpy.fetchHomeDataReturned = .fixture()
        sut.delegate = delegateSpy
        sut.fetchData()
        
        XCTAssertTrue(delegateSpy.didFetchHomeDataCalled)
    }
    
    func test_whenFetchDataIsCalled_whenReturnedDataIsNotNil_shouldCallDidFetchActivityDetailsOnce() {
        homeServiceSpy.fetchHomeDataReturned = .fixture()
        sut.delegate = delegateSpy
        sut.fetchData()
        
        XCTAssertEqual(delegateSpy.didFetchHomeDataCallCount, 1)
    }
    
    func test_whenFetchDataIsCalled_whenReturnedDataIsNil_shouldNotCallDidFetchActivityDetails() {
        homeServiceSpy.fetchHomeDataReturned = nil
        sut.delegate = delegateSpy
        sut.fetchData()
        
        XCTAssertFalse(delegateSpy.didFetchHomeDataCalled)
    }
    
    func test_fetchData_whenReturnedDataIsNotNil_shouldPassSameDataToDelegateMethod() {
        let returnedData: HomeData = .fixture(balance: 10.0)
        homeServiceSpy.fetchHomeDataReturned = returnedData
        sut.delegate = delegateSpy
        sut.fetchData()
        
        XCTAssertEqual(returnedData, delegateSpy.dataPassed)
    }
}
