//
//  FinanceServiceStub.swift
//  FinanceAppTests
//
//  Created by Henrique Augusto on 16/08/22.
//

import Foundation

@testable import FinanceApp

struct FinanceServiceStub: FinanceServiceProtocol {
    func fetchHomeData(_ completion: @escaping (HomeData?) -> Void) {
        
    }
    
    func fetchActivityDetails(_ completion: @escaping (ActivityDetails?) -> Void) {
        
    }
    
    func fetchContactList(_ completion: @escaping ([Contact]?) -> Void) {
        
    }
    
    func transferAmount(_ completion: @escaping (TransferResult?) -> Void) {
        
    }
    
    func fetchUserProfile(_ completion: @escaping (UserProfile?) -> Void) {
        let userProfile = JSONHelper().loadJsonFrom(fileName: "user-profile", type: UserProfile.self)!
        completion(userProfile)
    }
}
