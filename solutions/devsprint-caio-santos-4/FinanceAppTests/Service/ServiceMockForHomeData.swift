//
//  ServiceMockForHomeData.swift
//  FinanceAppTests
//
//  Created by Isabella Bencardino on 16/06/2022.
//

import Foundation
@testable import FinanceApp

class ServiceMockForHomeData: FinanceServiceProtocol {

    var serviceMockResponseType: ServiceMockResponseType

    init(serviceMockResponseType: ServiceMockResponseType) {
        self.serviceMockResponseType = serviceMockResponseType
    }

    func fetchHomeData(_ completion: @escaping (HomeData?) -> Void) {
        if let homeDataJson = homeDataJson {
            completion(getMock(data: homeDataJson))
        } else {
            completion(nil)
        }
    }

    func fetchActivityDetails(_ completion: @escaping (ActivityDetails?) -> Void) {}

    func fetchContactList(_ completion: @escaping ([Contact]?) -> Void) {}

    func transferAmount(_ completion: @escaping (TransferResult?) -> Void) {}

    func fetchUserProfile(_ completion: @escaping (UserProfile?) -> Void) {}
}

// MARK: Private methods

extension ServiceMockForHomeData {
    private func getMock(data: Data) -> HomeData? {
        switch serviceMockResponseType {
        case .valid:
            do {
                let decoder = JSONDecoder()
                let mock = try decoder.decode(HomeData.self, from: data)
                return mock
            } catch {
                return nil
            }
        case .invalid, .empty:
            return nil
        }
    }
}
