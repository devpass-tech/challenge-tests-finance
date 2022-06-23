//
//  NetworkingClientMock.swift
//  FinanceAppTests
//
//  Created by Hoff Silva on 2022-06-23.
//

@testable import FinanceApp

struct NetworkingClientMock: NetworkClientProtocol {
    func performRequest(with url: URL, completion: @escaping (Data?) -> ()) {
        completion(Data.fixture())
    }
}
