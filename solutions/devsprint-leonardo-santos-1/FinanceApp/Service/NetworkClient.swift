//
//  NetworkClient.swift
//  FinanceApp
//
//  Created by Rodrigo Borges on 02/03/22.
//

import Foundation

protocol NetworkClientProtocol {
    func performRequest(with url: URL, completion: @escaping (Data?) -> ())
}

final class NetworkClient: NetworkClientProtocol {
    
    private let urlSession: URLSession
    
    init(urlSession: URLSession = .shared) {
        self.urlSession = urlSession
    }
    
    func performRequest(with url: URL, completion: @escaping (Data?) -> ()) {
        
        let request = URLRequest(url: url)
        
        self.urlSession.dataTask(with: request) { data, response, error in
            
            if let _ = error {
                completion(nil)
                return
            }
            
            guard let response = response as? HTTPURLResponse else {
                completion(nil)
                return
            }
            
            switch response.statusCode {
            case 200...299:
                guard let data = data else {
                    completion(nil)
                    return
                }
                completion(data)
            case 400...499, 500...599:
                completion(nil)
            default:
                completion(nil)
            }
            
        }.resume()
    }
}
