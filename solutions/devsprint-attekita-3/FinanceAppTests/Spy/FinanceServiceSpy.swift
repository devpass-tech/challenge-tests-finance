//
//  FinanceServiceSpy.swift
//  FinanceAppTests
//
//  Created by Matheus Góes on 20/05/22.
//

import Foundation
@testable import FinanceApp

final class FinanceServiceSpy: FinanceServiceProtocol {
    var fetchHomeDataWasCalled = false
    var fetchActivityDetailsWasCalled = false
    var fetchContactListWasCalled = false
    var transferAmountWasCalled = false
    var fetchUserProfile = false
    
    func fetchHomeData(_ completion: @escaping (HomeData?) -> Void) {
        fetchHomeDataWasCalled = true
    }
    
    func fetchActivityDetails(_ completion: @escaping (ActivityDetails?) -> Void) {
        fetchActivityDetailsWasCalled = true
    }
    
    func fetchContactList(_ completion: @escaping (Result<[Contact], Error>) -> Void) {
        fetchContactListWasCalled = true
    }
    
    func transferAmount(_ completion: @escaping (TransferResult?) -> Void) {
        transferAmountWasCalled = true
    }
    
    func fetchUserProfile(_ completion: @escaping (UserProfile?) -> Void) {
        fetchUserProfile = true
    }
    
    
}
