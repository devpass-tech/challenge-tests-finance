//
//  NetworkClientSpy.swift
//  FinanceAppTests
//
//  Created by Hoff Silva on 2022-06-22.
//

import Foundation

@testable import FinanceApp

final class NetworClientSpy: NetworkClientProtocol {
    
    private(set) var passedURL: URL?
    private(set) var howManyTimeThatPerformRequestWasCalled: Int = 0
    private let passedData: Data
    
    init(data: Data) {
        self.passedData = data
    }
    
    func performRequest(with url: URL, completion: @escaping (Data?) -> ()) {
        passedURL = url
        howManyTimeThatPerformRequestWasCalled += 1
        completion(passedData)
    }
    
}
