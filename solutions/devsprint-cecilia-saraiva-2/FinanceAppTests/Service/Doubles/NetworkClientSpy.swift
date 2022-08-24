//
//  NetworkClientSpy.swift
//  FinanceAppTests
//
//  Created by Vitor Conceicao on 16/08/22.
//

import Foundation
@testable import FinanceApp

final class NetworkClientSpy: NetworkClientProtocol {
    enum Methods: Equatable {
        case performRequest(url: String)
    }
    
    private(set) var calledMethods: [Methods] = []
    private(set) var dataToBeReturned: Data?
    
    init(data: Data?) {
        self.dataToBeReturned = data
    }

    func performRequest(with url: URL, completion: @escaping (Data?) -> ()) {
        calledMethods.append(.performRequest(url: url.absoluteString))
        completion(dataToBeReturned)
    }
}
