//
//  NetworkClientMock.swift
//  FinanceAppTests
//
//  Created by Matheus Góes on 09/05/22.
//

import Foundation
@testable import FinanceApp

class NetworkClientMock: NetworkClientProtocol {
    func performRequest(with url: URL, completion: @escaping (Data?) -> ()) {

        guard let json = Bundle.main.path(forResource: self.getResourceName(url: url), ofType: "json") else { return }
        let url = URL(fileURLWithPath: json)

        do {
            let newData = try Data(contentsOf: url)
            completion(newData)
        } catch {
            completion(nil)
        }
        
    }
    
    func getResourceName(url: URL) -> String {
        
        var resourceName = ""
        
        let separatedValues = url.absoluteString.components(separatedBy: "/")
        resourceName = separatedValues[separatedValues.count - 1]
        let removeExtension = resourceName.components(separatedBy: ".")
        resourceName = removeExtension[0]
        
        return resourceName
    }
    
}
