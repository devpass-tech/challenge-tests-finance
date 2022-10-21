//
//  NetworkClientSpy.swift
//  FinanceAppTests
//
//  Created by Rafael de Paula on 19/10/22.
//

import Foundation
@testable import FinanceApp

final class NetworkClientSpy: NetworkClientProtocol {
    
    private(set) var performRequestCalled = false
    private(set) var performRequestUrlPassed: URL?
    
    var performRequestToBeReturned: Any?
    
    func performRequest<T>(with url: URL, completion: @escaping (Result<T, NetworkError>) -> ()) where T: Decodable {
        performRequestCalled = true
        performRequestUrlPassed = url
        
        if let result = performRequestToBeReturned as? Result<T, NetworkError> {
            completion(result)
        }
    }
}
