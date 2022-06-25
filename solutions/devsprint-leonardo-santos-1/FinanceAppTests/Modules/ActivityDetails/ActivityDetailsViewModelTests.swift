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
    private lazy var sut = ActivityDetailsViewModel(financeService: activityDetailsServiceSpy,
                                               mainDispatchQueue: dispatchQueueSpy)
    
    func test_whenFetchDataIsCalled_whenDataIsNotNil_shouldCallDispatchQueue() {
        activityDetailsServiceSpy.activityDetailsDataToBeReturned = ActivityDetails.fixture()
        sut.fetchData()
        
        XCTAssertTrue(dispatchQueueSpy.asyncCalled)
    }
    
    func test_whenFetchDataIsCalled_whenDataIsNotNil_shouldCallDispatchQueueOnce() {
        activityDetailsServiceSpy.activityDetailsDataToBeReturned = ActivityDetails.fixture()
        sut.fetchData()
        
        XCTAssertEqual(dispatchQueueSpy.asyncCalledCount, 1)
    }
    
    func test_whenFetchDataIsCalled_whenDataIsNil_shouldNotCallDispatchQueue() {
        activityDetailsServiceSpy.activityDetailsDataToBeReturned = nil
        sut.fetchData()
        
        XCTAssertFalse(dispatchQueueSpy.asyncCalled)
    }
}
