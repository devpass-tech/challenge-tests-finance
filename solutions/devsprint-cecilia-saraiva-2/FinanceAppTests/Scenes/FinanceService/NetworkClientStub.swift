//
//  NetworkClientStub.swift
//  FinanceAppTests
//
//  Created by Henrique Augusto on 16/08/22.
//
import Foundation

@testable import FinanceApp

final class NetworkClientStub: NetworkClientProtocol {
    let fileName: String
    var url: URL?
    private(set) var performRequestCount: Int = 0
    var isRequestSuccess: Bool
    
    init(fileName: String, url: URL?, isRequestSuccess: Bool) {
        self.fileName = fileName
        self.url = url
        self.isRequestSuccess = isRequestSuccess
    }

    func performRequest(with url: URL, completion: @escaping (Data?) -> ()) {
        self.url = url
        self.performRequestCount += 1
        
        let data = JSONHelper().loadDataFrom(fileName: fileName)
        
        if isRequestSuccess {
            completion(data)
        } else {
            completion(nil)
        }
    }
}
