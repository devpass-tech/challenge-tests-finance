//
//  NetworkClientMock.swift
//  FinanceAppTests
//
//  Created by Matheus Góes on 09/05/22.
//

import Foundation
@testable import FinanceApp

final class NetworkClientMock: NetworkClientProtocol {
    func performRequest(with url: URL, completion: @escaping (Data?) -> ()) {
        guard let json = Bundle(for: FinanceAppTests.self).path(forResource: self.getResourceName(url: url), ofType: "json") else {
            completion(nil)
            return
        }

        let url = URL(fileURLWithPath: json)

        do {
            let newData = try Data(contentsOf: url)
            completion(newData)
        } catch {
            completion(nil)
        }
    }
    
    private func getResourceName(url: URL) -> String {
        var resourceName = url.lastPathComponent
        resourceName = resourceName.components(separatedBy: ".")[0]
        return resourceName
    }
}
