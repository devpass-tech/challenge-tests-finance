//
//  FinanceServiceStub.swift
//  FinanceAppTests
//
//  Created by Murillo R. Araújo on 03/05/22.
//

import Foundation
@testable import FinanceApp

final class FinanceServiceStub: HomeServiceProtocol {
    static var homeDataToBeReturned: HomeData? = nil
    static func fetchHomeData(_ completion: @escaping (HomeData?) -> Void) {
        completion(homeDataToBeReturned)
    }
}
