//
//  FinanceServiceProtocolMock.swift
//  FinanceAppTests
//
//  Created by Julio Fernandes on 30/04/22.
//

import Foundation
@testable import FinanceApp

final class FinanceServiceProtocolMock: FinanceServiceProtocol {
    
    var fetchHomeDataToBeReturned: HomeData?
    private(set) var fetchHomeDataCalled = false
    func fetchHomeData(_ completion: @escaping (HomeData?) -> Void) {
        fetchHomeDataCalled = true
        completion(fetchHomeDataToBeReturned)
    }
    
    var fetchActivityDetailsToBeReturned: ActivityDetails?
    private(set) var fetchActivityDetailsCalled = false
    func fetchActivityDetails(_ completion: @escaping (ActivityDetails?) -> Void) {
        fetchActivityDetailsCalled = true
        completion(fetchActivityDetailsToBeReturned)
    }
    
    var fetchContactListToBeReturned: [Contact]?
    private(set) var fetchContactListCalled = false
    func fetchContactList(_ completion: @escaping ([Contact]?) -> Void) {
        fetchContactListCalled = true
        completion(fetchContactListToBeReturned)
    }
    
    var transferAmountToBeReturned: TransferResult?
    private(set) var transferAmountCalled = false
    func transferAmount(_ completion: @escaping (TransferResult?) -> Void) {
        transferAmountCalled = true
        completion(transferAmountToBeReturned)
    }
    
    var fetchUserProfileToBeReturned: UserProfile?
    private(set) var fetchUserProfileCalled = false
    func fetchUserProfile(_ completion: @escaping (UserProfile?) -> Void) {
        fetchUserProfileCalled = true
        completion(fetchUserProfileToBeReturned)
    }
    
}
