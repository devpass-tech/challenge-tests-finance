//
//  HomeService.swift
//  Core
//
//  Created by Willian Policiano on 22/03/22.
//

import Foundation

class HomeService {
    typealias Result = Swift.Result<Home, Error>

    private struct HomeResponse: Decodable {
        var balance_price: String?
        var svgs: Decimal?
        var spending: Decimal?

        func toDomain() -> Home?  {
            guard let savings = svgs,
                  let spending = spending,
                  let balanceString = balance_price,
                  let balance = Double(balanceString) else { return nil }

            return Home(
                balance: Decimal(balance),
                savings: savings,
                spending: spending)
        }
    }

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
                completion(.failure(Error.notOk))
            case let .success(response):
                let decoder = JSONDecoder()

                do {
                    let response = try decoder.decode(HomeResponse.self, from: response.data)
                    guard let home = response.toDomain() else {
                        return completion(.failure(Error.invalidData))
                    }

                    completion(.success(home))
                } catch {
                    print(error)
                    completion(.failure(Error.invalidData))
                }
            case .failure:
                completion(.failure(.connection))
            }
        }
    }

    enum Error: Swift.Error {
        case invalidData
        case connection
        case notOk
    }
}

struct HttpCodeNotOkError: Error { }
