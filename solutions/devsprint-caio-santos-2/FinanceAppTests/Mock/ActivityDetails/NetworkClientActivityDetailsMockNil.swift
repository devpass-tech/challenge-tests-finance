//
//  NetworkClientActivityDetailsMockNil.swift
//  FinanceAppTests
//
//  Created by Murillo R. Araújo on 24/03/22.
//

import Foundation
@testable import FinanceApp

class NetworkClientActivityDetailsMockNil: NetworkClientProtocol {
    func performRequest(with url: URL, completion: @escaping (Data?) -> ()) {
        completion(nil)
    }
}
