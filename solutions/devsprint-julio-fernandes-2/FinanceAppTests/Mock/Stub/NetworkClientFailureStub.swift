//
//  NetworkClientStubFailure.swift
//  FinanceAppTests
//
//  Created by Thiago Cezario on 23/08/22.
//

import Foundation
@testable import FinanceApp

final class NetworkClientFailureStub: NetworkClientProtocol {
    var url: URL?
    var callCount = 0
    
    func performRequest(with url: URL, completion: @escaping (Data?) -> ()) {
        self.url = url
        self.callCount += 1
        
        completion(nil)
    }
}
