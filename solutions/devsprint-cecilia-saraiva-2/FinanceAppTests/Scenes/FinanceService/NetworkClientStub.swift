//
//  NetworkClientStub.swift
//  FinanceAppTests
//
//  Created by Henrique Augusto on 16/08/22.
//
import Foundation

@testable import FinanceApp

final class NetworkClientSuccessStub: NetworkClientProtocol {
    let fileName: String
    var url: URL
    var callCount: Int?
    
    init(fileName: String, url: URL) {
        self.fileName = fileName
        self.url = url
    }

    func performRequest(with url: URL, completion: @escaping (Data?) -> ()) {
        self.url = url
        self.callCount = 1
        
        let data = JSONHelper().loadDataFrom(fileName: fileName)
        completion(data)
    }
}

struct NetworkClientFailureStub: NetworkClientProtocol {
    func performRequest(with url: URL, completion: @escaping (Data?) -> ()) {
        completion(nil)
    }
}
