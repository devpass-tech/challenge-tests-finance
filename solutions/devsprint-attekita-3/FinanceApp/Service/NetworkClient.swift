//
//  NetworkClient.swift
//  FinanceApp
//
//  Created by Rodrigo Borges on 02/03/22.
//

import UIKit

typealias Completion = (Result<Data, ApiError>) -> Void

protocol NetworkClientProtocol {
    func performRequest(with url: URL, completion: @escaping Completion)
}

final class NetworkClient: NetworkClientProtocol {

    func performRequest(with url: URL, completion: @escaping Completion) {

        let request = URLRequest(url: url)

        let task = URLSession.shared.dataTask(with: request) { data, response, error in

            if let error = error {
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

            completion(.success(data))
        }
        task.resume()
    }
}
