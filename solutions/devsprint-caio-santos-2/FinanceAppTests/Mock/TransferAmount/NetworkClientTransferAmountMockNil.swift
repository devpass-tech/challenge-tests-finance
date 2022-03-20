//
//  NetworkClientTransferAmountMockNil.swift
//  FinanceAppTests
//
//  Created by Caio Santos on 20/03/22.
//

import Foundation
@testable import FinanceApp

class NetworkClientTransferAmountMockNil: NetworkClientProtocol {
    func performRequest(with url: URL, completion: @escaping (Data?) -> ()) {
        completion(nil)
    }
}
