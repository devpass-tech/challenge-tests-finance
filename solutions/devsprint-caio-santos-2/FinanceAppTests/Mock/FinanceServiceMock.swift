//
//  FinanceServiceMock.swift
//  FinanceAppTests
//
//  Created by Murillo R. Araújo on 15/03/22.
//

import Foundation
@testable import FinanceApp

enum APIError: Error {
    case noData
    case parseError
}

class FinanceServiceMock: FinanceServiceProtocol {

    var errorAPI: APIError? = nil

    func fetchHomeData(_ completion: @escaping (HomeData?) -> Void) {

        switch errorAPI {
            case .parseError:
                completion(nil)
            case .noData:
                completion(nil)
        default:
            if let result = parseJSONMock() {
                completion(result)
            } else {
                completion(nil)
            }
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

    private func parseJSONMock() -> HomeData? {

        guard let path = Bundle.main.path(forResource: "home_data", ofType: "json") else { return nil }

        do {
            let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
            let result = try JSONDecoder().decode(HomeData.self, from: data)
            return result
        } catch  {
            return nil
        }
    }
}
