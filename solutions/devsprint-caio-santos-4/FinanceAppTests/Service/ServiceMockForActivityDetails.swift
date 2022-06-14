//
//  ServiceMockForActivityDetails.swift
//  FinanceAppTests
//
//  Created by Anderson Oliveira on 13/06/22.
//

import Foundation
@testable import FinanceApp

enum validOrNotJson {
    case isValid
    case isNotValid
}

class ServiceMockForActivityDetails: FinanceServiceProtocol {
    
    var isValidJson: Bool
    
    
    
    init(wantValidJson: Bool){
        self.isValidJson = wantValidJson
    }
    
    func getMock(data: Data, validOrNotJson: Bool) -> ActivityDetails? {
        if isValidJson {
            do {
                let decoder = JSONDecoder()
                let mock = try decoder.decode(ActivityDetails.self, from: data)
                return mock
            } catch {
                return nil
            }
        } else {
            return nil
        }
    }
    
    func fetchHomeData(_ completion: @escaping (HomeData?) -> Void) {}
    
    func fetchActivityDetails(_ completion: @escaping (ActivityDetails?) -> Void)  {
        
        if let activityDetailsJson = activityDetailsJson {
            let mock = getMock(data: activityDetailsJson, validOrNotJson: isValidJson)
            completion(mock)
        } else {
            completion(nil)
        }
    }
    
    func fetchContactList(_ completion: @escaping ([Contact]?) -> Void) {}
    
    func transferAmount(_ completion: @escaping (TransferResult?) -> Void) {}
    
    func fetchUserProfile(_ completion: @escaping (UserProfile?) -> Void) {}
}
