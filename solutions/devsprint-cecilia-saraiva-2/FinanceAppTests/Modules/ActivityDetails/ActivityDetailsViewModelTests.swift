//
//  ActivityDetailsViewModel.swift
//  FinanceAppTests
//
//  Created by Leonardo Almeida on 22/08/22.
//

import Foundation
import XCTest

@testable import FinanceApp

final class ActivityDetailsViewModelTests: XCTestCase {
    
    let delegate = ActivityDetailsViewModelDelegateStub()
    
    func test_WhenFecthData_ShouldReturnCountOne() {
        // GIVEN
        let financeServiceStub = FinanceServiceStub()
        
        var activityViewModelStub = ActivityDetailsViewModel(financeService: financeServiceStub)
        activityViewModelStub.delegate = delegate
        
        // WHEN
        activityViewModelStub.fetchData()
        
        let expectation = expectation(description: "test_WhenFecthData_ShouldReturnCountOne")
        
        // THEN
        XCTAssertEqual(financeServiceStub.countFetchActivityDetails, 1)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5, execute: {
            XCTAssertEqual(self.delegate.countDidFetchActivityDetails, 1)
            
            expectation.fulfill()
        })
        wait(for: [expectation], timeout: 2.0)
    }
}

final class ActivityDetailsViewModelDelegateStub: ActivityDetailsViewModelDelegate {
    var countDidFetchActivityDetails: Int = 0
    
    func didFetchActivityDetails(_ data: ActivityDetails) {
        self.countDidFetchActivityDetails += 1
    }
}

class FinanceServiceStub: FinanceServiceProtocol {
    private(set) var countFetchActivityDetails: Int = 0
    
    func fetchHomeData(_ completion: @escaping (HomeData?) -> Void) {}
    
    func fetchActivityDetails(_ completion: @escaping (ActivityDetails?) -> Void) {
        self.countFetchActivityDetails += 1
        completion(ActivityDetails.mock())
    }
    
    func fetchContactList(_ completion: @escaping ([Contact]?) -> Void) {}
    
    func transferAmount(_ completion: @escaping (TransferResult?) -> Void) {}
    
    func fetchUserProfile(_ completion: @escaping (UserProfile?) -> Void) {}
}

