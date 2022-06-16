//
//  FakeFinanceService.swift
//  FinanceAppTests
//
//  Created by Hyago Henrique on 14/06/22.
//

import Foundation
@testable import FinanceApp

class FakeFinanceService: FinanceServiceProtocol {
    var nilData: Bool = false
    var successData: Bool = true
    
    init(nilData: Bool, successData: Bool) {
        self.nilData = nilData
        self.successData = successData
    }
    
    func fetchHomeData(_ completion: @escaping (HomeData?) -> Void) {
        if nilData {
            completion(nil)
        }
        if successData {
            completion(
                responseFetchHomeData
            )
        }
    }
    
    func fetchActivityDetails(_ completion: @escaping (ActivityDetails?) -> Void) {
        
    }
    
    func fetchContactList(_ completion: @escaping ([Contact]?) -> Void) {
        
    }
    
    func transferAmount(_ completion: @escaping (TransferResult?) -> Void) {
        
    }
    
    func fetchUserProfile(_ completion: @escaping (UserProfile?) -> Void) {
        
    }
    
    
}
