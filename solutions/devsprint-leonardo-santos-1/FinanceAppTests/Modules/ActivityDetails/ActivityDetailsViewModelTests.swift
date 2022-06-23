//
//  ActivityDetailsViewModelTests.swift
//  FinanceAppTests
//
//  Created by Leonardo Cunha on 25/06/22.
//

@testable import FinanceApp
import XCTest

final class ActivityDetailsViewModelTests: XCTestCase {
    private let activityDetailsServiceSpy = FinanceServiceActivityDetailsSpy()
    private let dispatchQueueSpy = DispatchQueueSpy()
    private let delegateSpy = ActivityDetailsViewModelDelegateSpy()
    private lazy var sut = ActivityDetailsViewModel(financeService: activityDetailsServiceSpy,
                                               mainDispatchQueue: dispatchQueueSpy)
    
    func test_whenFetchDataIsCalled_whenDataIsNotNil_shouldCallDispatchQueue() {
        activityDetailsServiceSpy.activityDetailsDataToBeReturned = .fixture()
        sut.fetchData()
        
        XCTAssertTrue(dispatchQueueSpy.asyncCalled)
    }
    
    func test_whenFetchDataIsCalled_whenDataIsNotNil_shouldCallDispatchQueueOnce() {
        activityDetailsServiceSpy.activityDetailsDataToBeReturned = .fixture()
        sut.fetchData()
        
        XCTAssertEqual(dispatchQueueSpy.asyncCalledCount, 1)
    }
    
    func test_whenFetchDataIsCalled_whenDataIsNil_shouldNotCallDispatchQueue() {
        activityDetailsServiceSpy.activityDetailsDataToBeReturned = nil
        sut.fetchData()
        
        XCTAssertFalse(dispatchQueueSpy.asyncCalled)
    }
    
    func test_whenFetchDataIsCalled_shouldCallFetchActivityDetails() {
        sut.fetchData()
        
        XCTAssertTrue(activityDetailsServiceSpy.fetchActivityDetailsCalled)
    }
    
    func test_whenFetchDataIsCalled_shouldCallFetchActivityDetailsOnce() {
        sut.fetchData()
        
        XCTAssertEqual(activityDetailsServiceSpy.fetchActivityDetailsCalledCount, 1)
    }
    
    func test_whenFetchDataIsCalled_whenReturnedDataIsNotNil_shouldCallDidFetchActivityDetails() {
        activityDetailsServiceSpy.activityDetailsDataToBeReturned = .fixture()
        sut.delegate = delegateSpy
        sut.fetchData()
        
        XCTAssertTrue(delegateSpy.didFetchActivityDetailsCalled)
    }
    
    func test_whenFetchDataIsCalled_whenReturnedDataIsNotNil_shouldCallDidFetchActivityDetailsOnce() {
        activityDetailsServiceSpy.activityDetailsDataToBeReturned = .fixture()
        sut.delegate = delegateSpy
        sut.fetchData()
        
        XCTAssertEqual(delegateSpy.didFetchActivityDetailsCallCount, 1)
    }
    
    func test_whenFetchDataIsCalled_whenReturnedDataIsNil_shouldNotCallDidFetchActivityDetails() {
        activityDetailsServiceSpy.activityDetailsDataToBeReturned = nil
        sut.delegate = delegateSpy
        sut.fetchData()
        
        XCTAssertFalse(delegateSpy.didFetchActivityDetailsCalled)
    }
    
    func test_fetchData_whenReturnedDataIsNotNil_shouldPassSameDataToDelegateMethod() {
        let returnedData: ActivityDetails = .fixture(name: "Cunha")
        activityDetailsServiceSpy.activityDetailsDataToBeReturned = returnedData
        sut.delegate = delegateSpy
        sut.fetchData()
        
        XCTAssertEqual(returnedData, delegateSpy.dataPassed)
    }

    func test_whenCallFetchData_itShouldReturnADelegateCall() {
        sut.delegate = activityDetailsViewModelDelegateSpy
        sut.fetchData()
        let expec = expectation(description: "")
        DispatchQueue.main.async {
            expec.fulfill()
        }
        wait(for: [expec], timeout: 1)
        XCTAssertTrue(self.activityDetailsViewModelDelegateSpy.isActivityDetailsViewModeldelegateCalled)
    }
    
    func test_whenCallFetchData_itShouldReturnADelegateCallWithActivityDetails() {
        sut.delegate = activityDetailsViewModelDelegateSpy
        sut.fetchData()
        let expec = expectation(description: "")
        DispatchQueue.main.async {
            expec.fulfill()
        }
        wait(for: [expec], timeout: 1)
        XCTAssertNotNil(self.activityDetailsViewModelDelegateSpy.dataPassed)
    }
}