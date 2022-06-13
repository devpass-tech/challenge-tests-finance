//
//  ServiceMockForActivityDetails.swift
//  FinanceAppTests
//
//  Created by Anderson Oliveira on 13/06/22.
//

import Foundation
@testable import FinanceApp

class ServiceMockForActivityDetails: FinanceServiceProtocol {
    
    func getMock(data: Data) -> ActivityDetails? {
        do {
            let decoder = JSONDecoder()
            let mock = try decoder.decode(ActivityDetails.self, from: data)
            return mock
        } catch {
            return nil
        }
    }
    
    func fetchHomeData(_ completion: @escaping (HomeData?) -> Void) {}
    
    func fetchActivityDetails(_ completion: @escaping (ActivityDetails?) -> Void)  {
        
        if let activityDetailsJson = activityDetailsJson {
            let mock = getMock(data: activityDetailsJson)
            completion(mock)
        } else {
            completion(nil)
        }
    }
    
    func fetchContactList(_ completion: @escaping ([Contact]?) -> Void) {}
    
    func transferAmount(_ completion: @escaping (TransferResult?) -> Void) {}
    
    func fetchUserProfile(_ completion: @escaping (UserProfile?) -> Void) {}
}
