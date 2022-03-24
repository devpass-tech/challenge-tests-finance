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
            case let .success(response):
                completion(self.map(response: response))
            case .failure:
                completion(.failure(.connection))
            }
        }
    }

    private func map(response: (code: Int, data: Data)) -> Result {
        let httpOK = 200

        guard response.code == httpOK else {
            return .failure(.notOk)
        }

        let decoder = JSONDecoder()

        do {
            let response = try decoder.decode(HomeResponse.self, from: response.data)
            guard let home = response.toDomain() else {
                return .failure(.invalidData)
            }

            return .success(home)
        } catch {
            return .failure(.invalidData)
        }
    }

    enum Error: Swift.Error {
        case invalidData
        case connection
        case notOk
    }
}
