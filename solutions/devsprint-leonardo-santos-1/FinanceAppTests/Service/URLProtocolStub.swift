//
//  URLProtocolStub.swift
//  FinanceAppTests
//
//  Created by Hoff Silva on 2022-06-21.
//

import Foundation

class URLProtocolStub: URLProtocol {
    
    override class func canInit(with request: URLRequest) -> Bool {
        true
    }
    
    override class func canonicalRequest(for request: URLRequest) -> URLRequest {
        request
    }
    
    override func startLoading() {
        client?.urlProtocolDidFinishLoading(self)
    }
    
    override func stopLoading() {}
}
