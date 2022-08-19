//
//  NetworkClientStub.swift
//  FinanceAppTests
//
//  Created by Henrique Augusto on 16/08/22.
//
import Foundation

@testable import FinanceApp

final class NetworkClientSuccessStub: NetworkClientProtocol {
    var fileName: String
    var url: URL!
    var callCount = 0

    init(fileName: String) {
        self.fileName = fileName
    }
    
    func performRequest(with url: URL, completion: @escaping (Data?) -> ()) {
        self.url = url
        self.callCount += 1
        
        let data = JSONHelper().loadDataFrom(fileName: fileName)
        completion(data)
    }
}

final class NetworkClientFailureStub: NetworkClientProtocol {
    var url: URL!
    var callCount = 0
    
    func performRequest(with url: URL, completion: @escaping (Data?) -> ()) {
        self.url = url
        self.callCount += 1
        
        completion(nil)
    }
}
