//
//  HomeService.swift
//  Core
//
//  Created by Willian Policiano on 22/03/22.
//

import Foundation

class HomeService {
    typealias Result = Swift.Result<Home, Error>

    private let httpClient: HttpClient
    private let url: URL

    private let httpOK = 200

    init(url: URL, httpClient: HttpClient) {
        self.url = url
        self.httpClient = httpClient
    }

    func getHome(completion: @escaping (Result) -> Void) {
        httpClient.request(url: url) { result in
            switch result {
            case let .success(response) where response.code != self.httpOK:
                completion(.failure(HttpCodeNotOkError()))
            case let .success(response):
                let decoder = JSONDecoder()

                do {
                    let home = try decoder.decode(Home.self, from: response.data)

                    completion(.success(home))
                } catch {
                    completion(.failure(error))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}

struct HttpCodeNotOkError: Error { }

struct Home: Decodable, Equatable {
    let balance: Decimal
}
