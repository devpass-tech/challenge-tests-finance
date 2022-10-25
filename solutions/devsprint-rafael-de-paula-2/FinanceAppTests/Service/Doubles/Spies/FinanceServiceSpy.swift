//
//  FinanceServiceSpy.swift
//  FinanceAppTests
//
//  Created by Rafael de Paula on 25/10/22.
//

import Foundation
@testable import FinanceApp

final class FinanceServiceSpy: FinanceServiceProtocol {
    
    private(set) var fetchHomeDataCalled = false
    var fetchHomeDataToBeReturned: Result<HomeData, Error>?
    
    func fetchHomeData(_ completion: @escaping (Result<HomeData, Error>) -> Void) {
        fetchHomeDataCalled = true
        if let result = fetchHomeDataToBeReturned {
            completion(result)
        }
    }
    
    private(set) var fetchActivityDetailsCalled = false
    var fetchActivityDetailsToBeReturned: Result<ActivityDetails, Error>?
    
    func fetchActivityDetails(_ completion: @escaping (Result<ActivityDetails, Error>) -> Void) {
        fetchActivityDetailsCalled = true
        if let result = fetchActivityDetailsToBeReturned {
            completion(result)
        }
    }
    
    private(set) var fetchContactListCalled = false
    var fetchContactListToBeReturned: Result<[Contact], Error>?
    
    func fetchContactList(_ completion: @escaping (Result<[Contact], Error>) -> Void) {
        fetchContactListCalled = true
        if let result = fetchContactListToBeReturned {
            completion(result)
        }
    }
    
    private(set) var transferAmountCalled = false
    var transferAmountToBeReturned: Result<TransferResult, Error>?
    
    func transferAmount(_ completion: @escaping (Result<TransferResult, Error>) -> Void) {
        transferAmountCalled = true
        if let result = transferAmountToBeReturned {
            completion(result)
        }
    }
    
    private(set) var fetchUserProfileCalled = false
    var fetchUserProfileToBeReturned: Result<UserProfile, Error>?
    
    func fetchUserProfile(_ completion: @escaping (Result<UserProfile, Error>) -> Void) {
        fetchUserProfileCalled = true
        if let result = fetchUserProfileToBeReturned {
            completion(result)
        }
    }
}

