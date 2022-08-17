//
//  NetworkClientStub.swift
//  FinanceAppTests
//
//  Created by Henrique Augusto on 16/08/22.
//

import Foundation

@testable import FinanceApp

struct NetworkClientSuccessStub: NetworkClientProtocol {
    let fileName: String
    
    func performRequest(with url: URL, completion: @escaping (Data?) -> ()) {
        let data = JSONHelper().loadDataFrom(fileName: fileName)
        completion(data)
    }
}

struct NetworkClientFailureStub: NetworkClientProtocol {
    func performRequest(with url: URL, completion: @escaping (Data?) -> ()) {
        completion(nil)
    }
}
