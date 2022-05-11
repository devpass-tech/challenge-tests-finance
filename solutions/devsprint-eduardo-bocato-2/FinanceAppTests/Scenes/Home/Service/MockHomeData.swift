//
//  MockHomeData.swift
//  FinanceAppTests
//
//  Created by Gustavo Soares on 06/05/22.
//

import Foundation

@testable import FinanceApp

final class MockHomeData {
    static var homeData: HomeData? {
        if let fileURL = Bundle(for: self)
            .url(forResource: "homedatamock",
                 withExtension: "json") {
            do {
                let data = try Data(contentsOf: fileURL)
                return try JSONDecoder()
                    .decode(HomeData.self,
                            from: data)
            } catch {
                return nil
            }
        }
        return nil
    }
}
