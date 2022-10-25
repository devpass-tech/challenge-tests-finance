//
//  NetworkClient.swift
//  FinanceApp
//
//  Created by Rodrigo Borges on 02/03/22.
//

import Foundation

protocol NetworkClientProtocol {
    func performRequest<T: Decodable>(with url: URL, completion: @escaping (Result<T, NetworkError>) -> ())
}

final class NetworkClient: NetworkClientProtocol {
    
    func performRequest<T>(with url: URL, completion: @escaping (Result<T, NetworkError>) -> ()) where T : Decodable {
        let request = URLRequest(url: url)

        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let error {
                completion(.failure(.requestFailed(error)))
                return
            }
            
            if let response = response as? HTTPURLResponse, !(200...299 ~= response.statusCode) {
                completion(.failure(.errorNetwork))
                return
            }
            
            guard let data = data else {
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
        task.resume()
    }
}

enum NetworkError: Error, Equatable {
    case errorNetwork
    case requestFailed(Error)
    case noData
    case parseError
    
    static func == (lhs: NetworkError, rhs: NetworkError) -> Bool {
        lhs.localizedDescription == rhs.localizedDescription
    }
}
