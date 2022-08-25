//
//  NetworkClientMock.swift
//  FinanceAppTests
//
//  Created by Raline Maria da Silva on 19/08/22.
//

import XCTest
@testable import FinanceApp

class NetworkClientMock: NetworkClientProtocol {
    
    var url: URL?
    var perfomRequestCallCount = 0
    var data: Data?
    var shouldSucceed = true
    
    func performRequest(with url: URL, completion: @escaping (Data?) -> ()) {
        
        self.url = url
        self.perfomRequestCallCount += 1
        
        if shouldSucceed {
            completion(data)
            
        }else {
           completion(nil)
        }
    }

    // MARK: Private properties
    let contactListData =  {
    """
    [
    {
    "name": "Ana",
    "phone": "+55 (81) 99999-9999"
    },
    {
    "name": "Maria",
    "phone": "+55 (81) 11111-1111"
    }
    ]
    """.data(using: .utf8)
    }()
}
