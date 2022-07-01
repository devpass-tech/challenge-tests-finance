//
//  NetworkClientSpy.swift
//  FinanceAppTests
//
//  Created by Hoff Silva on 2022-06-24.
//

import Foundation

@testable import FinanceApp

final class NetworkClientSpy: NetworkClientProtocol {
    
    private(set) var performRequestCalled: Bool = false
    private(set) var performRequestCallCount: Int = 0
    private(set) var performRequestPassed: URL?
    var dataToBeReturned: Data?
    
    func performRequest(with url: URL, completion: @escaping (Data?) -> ()) {
        performRequestCalled = true
        performRequestPassed = url
        performRequestCallCount += 1
        completion(dataToBeReturned)
    }
}
