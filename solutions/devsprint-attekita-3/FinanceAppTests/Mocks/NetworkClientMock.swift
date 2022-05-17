//
//  NetworkClientMock.swift
//  FinanceAppTests
//
//  Created by Matheus Góes on 09/05/22.
//

import Foundation
@testable import FinanceApp

final class NetworkClientMock: NetworkClientProtocol {
    
    enum Response {
        case success
        case successWithCustomJson(String)
        case error(ApiError)
    }
    
    var expectedResponse: Response = .success
    
    func performRequest(with url: URL, completion: @escaping Completion) {
        var json: String? = nil
        
        switch expectedResponse {
        case .success:
            json = Bundle(for: FinanceAppTests.self).path(forResource: self.getResourceName(url: url), ofType: "json")
        case .successWithCustomJson(let jsonFilename):
            json = Bundle(for: FinanceAppTests.self).path(forResource: jsonFilename, ofType: "json")
        case .error(let error):
            completion(.failure(error))
            return
        }
        
        guard let json = json else {
            completion(.failure(.invalidURL))
            return
        }
        
        let url = URL(fileURLWithPath: json)

        do {
            let newData = try Data(contentsOf: url)
            completion(.success(newData))
        } catch {
            completion(.failure(.noData))
        }
        
    }
    
    private func getResourceName(url: URL) -> String {
        var resourceName = url.lastPathComponent
        resourceName = resourceName.components(separatedBy: ".")[0]
        return resourceName
    }
}
