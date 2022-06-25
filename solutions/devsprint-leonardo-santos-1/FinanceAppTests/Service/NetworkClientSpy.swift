//
//  NetworkClientSpy.swift
//  FinanceAppTests
//
//  Created by Junior Margalho on 22/06/22.
//

import Foundation

@testable import FinanceApp

final class NetworkClientSpy: NetworkClientProtocol {
    private(set) var performRequestCalled: Bool = false
    private(set) var performRequestCallCount: Int = 0
    private(set) var performRequestUrlPassed: URL?
     var performRequestCompletionToBeReturned: Data?
    
    func performRequest(with url: URL, completion: @escaping (Data?) -> ()) {
        performRequestCalled = true
        performRequestCallCount += 1
        performRequestUrlPassed = url
        completion(performRequestCompletionToBeReturned)
    }
}
