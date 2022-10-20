//
//  NetworkClientStub.swift
//  FinanceAppTests
//
//  Created by Rafael de Paula on 20/10/22.
//

import Foundation
@testable import FinanceApp

final class NetworkClientStub: NetworkClientProtocol {
    private let filename: String
    private var url: URL? = nil
    
    init(filename: String) {
        self.filename = filename
    }
    
    func performRequest<T>(with url: URL, completion: @escaping (Result<T, NetworkError>) -> ()) where T : Decodable {
        self.url = url
        
        guard
            let path = Bundle(for: type(of: self)).url(forResource: filename, withExtension: "json"),
            let data = try? Data(contentsOf: path)
        else {
            completion(.failure(.noData))
            return
        }
        
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        
        guard let decoded = try? decoder.decode(T.self, from: data) else {
            completion(.failure(.parseError))
            return
        }
        
        completion(.success(decoded))
    }
}
