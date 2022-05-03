//
//  FinanceServiceMock.swift
//  FinanceAppTests
//
//  Created by Murillo R. Araújo on 03/05/22.
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
            let homeData = HomeData(balance: 100, savings: 500, spending: 100, activity: [])
            completion(homeData)
        }
    }
}
