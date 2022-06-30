//
//  MockURLSession.swift
//  FinanceAppTests
//
//  Created by Hoff Silva on 2022-06-29.
//

import Foundation

@testable import FinanceApp

final class MockURLSession: URLSessionProtocol {
    
    private(set) var dataTaskCallCount = 0
    private(set) var requestToBeReturned: [URLRequest] = []
    private(set) var urlToBeReturned: URL?
    
    private let receivedData: Data?
    private let receivedResponse: URLResponse?
    private let receivedError: Error?
    
    init(receivedData: Data? = nil,
         receivedResponse: URLResponse? = nil,
         receivedError: Error? = nil) {
        self.receivedData = receivedData
        self.receivedResponse = receivedResponse
        self.receivedError = receivedError
    }
    
    func dataTask(with request: URLRequest, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
        dataTaskCallCount += 1
        requestToBeReturned.append(request)
        urlToBeReturned = request.url
        completionHandler(self.receivedData, self.receivedResponse, self.receivedError)
        return DummyURLSessionDataTask()
    }
    
}

final private class DummyURLSessionDataTask: URLSessionDataTask {
    override func resume() {}
}
