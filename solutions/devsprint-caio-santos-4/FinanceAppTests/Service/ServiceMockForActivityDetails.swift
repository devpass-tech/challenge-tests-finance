//
//  ServiceMockForActivityDetails.swift
//  FinanceAppTests
//
//  Created by Anderson Oliveira on 13/06/22.
//

import Foundation
@testable import FinanceApp

enum ServiceMockResponseType {
    case valid
    case invalid
    case empty
}

class ServiceMockForActivityDetails: FinanceServiceProtocol {
    var serviceMockResponseType: ServiceMockResponseType
    
    init(_ serviceMockResponseType: ServiceMockResponseType) {
        self.serviceMockResponseType = serviceMockResponseType
    }
    
    func fetchHomeData(_ completion: @escaping (HomeData?) -> Void) {}
    
    func fetchActivityDetails(_ completion: @escaping (ActivityDetails?) -> Void)  {
        if let activityDetailsJson = activityDetailsJson {
            completion(getMock(data: activityDetailsJson))
        } else {
            completion(nil)
        }
    }
    
    func fetchContactList(_ completion: @escaping ([Contact]?) -> Void) {}
    
    func transferAmount(_ completion: @escaping (TransferResult?) -> Void) {}
    
    func fetchUserProfile(_ completion: @escaping (UserProfile?) -> Void) {}
}

// MARK: Private Methods

extension ServiceMockForActivityDetails {
    private func getMock(data: Data) -> ActivityDetails? {
        switch serviceMockResponseType {
        case .valid:
            do {
                let decoder = JSONDecoder()
                let mock = try decoder.decode(ActivityDetails.self, from: data)
                return mock
            } catch {
                return nil
            }
        case .invalid, .empty:
            return nil
        }
    }
}
