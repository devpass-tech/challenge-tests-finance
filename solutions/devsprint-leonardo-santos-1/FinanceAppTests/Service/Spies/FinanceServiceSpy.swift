//
//  FinanceServiceSpy.swift
//  FinanceAppTests
//
//  Created by Pedro Menezes on 23/06/22.
//

import Foundation
@testable import FinanceApp

class NetworkSpy: NetworkClientProtocol {
    var performRequestCount = 0
    var data: Data?

    func performRequest(with url: URL, completion: @escaping (Data?) -> ()) {
        performRequestCount += 1
        completion(data)
    }
}
