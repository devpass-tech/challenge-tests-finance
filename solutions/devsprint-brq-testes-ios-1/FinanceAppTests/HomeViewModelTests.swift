//
//  HomeViewModelTests.swift
//  FinanceAppTests
//
//  Created by Rodrigo Borges on 13/09/22.
//

import XCTest
@testable import FinanceApp

final class HomeViewModelTests: XCTestCase {
    
    let dispatchQueueSpy = DispatchQueueSpy()
    let financeServiceSpy = FinanceServiceSpy()
    let delegateSpy = HomeViewModelDelegateSpy()
    lazy var sut = HomeViewModel(financeService: financeServiceSpy, dispatchQueue: dispatchQueueSpy)
    
    func test_didFetchHomeData_isCalled () {
        //Given
        sut.delegate = delegateSpy
        //When
        sut.fetchData()
        //Then
        XCTAssertTrue(delegateSpy.delegateIsCalled)
    }
    
    func test_fetchHomeDataAndDispatchQueue_isCalled() {
        //when
        sut.fetchData()
        //then
        XCTAssertTrue(financeServiceSpy.fetchHomeDataIsCalled)
        XCTAssertTrue(dispatchQueueSpy.isDispatchCalled)
    }
    
    func test_fetchData_shouldNotCallDelegate_whenHomedataIsNill () {
        // Given
        financeServiceSpy.homeData = nil
        //When
        sut.fetchData()
        //Then
        XCTAssertFalse(dispatchQueueSpy.isDispatchCalled)
    }
}

class HomeViewModelDelegateSpy: HomeViewModelDelegate {
    var delegateIsCalled: Bool = false
    
    func didFetchHomeData(_ data: FinanceApp.HomeData) {
        delegateIsCalled = true
    }
}

class FinanceServiceSpy: FetchHomeDataProtocol {
    
    var homeData: HomeData? = HomeData(balance: 0, savings: 0, spending: 0, activity: [Activity(name: "", price: 0, time: "")])
    var fetchHomeDataIsCalled: Bool = false
    
    func fetchHomeData(_ completion: @escaping (FinanceApp.HomeData?) -> Void) {
        fetchHomeDataIsCalled = true
        completion(homeData)
    }
}
