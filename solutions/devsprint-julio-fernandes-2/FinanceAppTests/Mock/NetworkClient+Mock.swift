//
//  NetworkClientMock.swift
//  FinanceAppTests
//
//  Created by Thiago Cezario on 17/08/22.
//

import Foundation
@testable import FinanceApp

final class NetworkClientMock: NetworkClientProtocol {
    private lazy var encoder = JSONEncoder()
    
    var url: URL!
    var shouldSucceed = true
    
    func performRequest(with url: URL, completion: @escaping (Data?) -> ()) {
        self.url = url
        
        if shouldSucceed {
            let dataMock = ActivityDetails.mock()
            let data = try! encoder.encode(dataMock)
            completion(data)
        } else {
            completion(nil)
        }
    }
}
