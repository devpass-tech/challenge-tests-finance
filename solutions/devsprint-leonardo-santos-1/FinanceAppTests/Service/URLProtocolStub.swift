//
//  URLProtocolStub.swift
//  FinanceAppTests
//
//  Created by Hoff Silva on 2022-06-23.
//

import Foundation

class URLProtocolStub: URLProtocol {
    
    static var onNext: ((URLRequest) -> Void)?

        static var data: Data?
        static var response: URLResponse?
        static var error: Error?
        
        static func subscribe(onNext: @escaping (URLRequest) -> Void) {
            URLProtocolStub.onNext = onNext
        }
        
        static func configureRequest(data: Data?, response: URLResponse?, and error: Error?) {
            URLProtocolStub.data = data
            URLProtocolStub.response = response
            URLProtocolStub.error = error
        }
        
        override class func canInit(with request: URLRequest) -> Bool {
            true
        }
        
        override class func canonicalRequest(for request: URLRequest) -> URLRequest {
            request
        }
        
        override func startLoading() {
            URLProtocolStub.onNext?(request)
            
            if let data = URLProtocolStub.data {
                client?.urlProtocol(self, didLoad: data)
            }
            
            if let response = URLProtocolStub.response {
                client?.urlProtocol(self, didReceive: response, cacheStoragePolicy: .notAllowed)
            }
            
            if let error = URLProtocolStub.error {
                client?.urlProtocol(self, didFailWithError: error)
            }
            
            client?.urlProtocolDidFinishLoading(self)
        }
        
        override func stopLoading() {}
}
