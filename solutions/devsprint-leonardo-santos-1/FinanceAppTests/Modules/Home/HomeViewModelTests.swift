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
    private lazy var homeServiceSpy = FinanceServiceHomeSpy()
    
    private lazy var sut = HomeViewModel(financeService: homeServiceSpy,
                                    mainDispatchQueue: dispatchQueueSpy)
    
    
    func test_whenFetchDataIsCalled_whenDataIsNotNil_dispatchQueueShouldBeCalled() {
        homeServiceSpy.homeDataToBeReturned = HomeData.fixture()
        sut.fetchData()
        
        XCTAssertTrue(dispatchQueueSpy.asyncCalled)
    }
    
    func test_whenFetchDataIsCalled_whenDataIsNotNil_dispatchQueueShouldBeCalledOnce() {
        homeServiceSpy.homeDataToBeReturned = HomeData.fixture()
        sut.fetchData()
        
        XCTAssertEqual(dispatchQueueSpy.asyncCalledCount, 1)
    }
    
    func test_whenFetchDataIsCalled_whenDataIsNil_dispatchQueueShouldNotBeCalled() {
        homeServiceSpy.homeDataToBeReturned = nil
        sut.fetchData()

        XCTAssertFalse(dispatchQueueSpy.asyncCalled)
    }
}
