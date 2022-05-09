//
//  HomeServiceStub.swift
//  FinanceAppTests
//
//  Created by Gustavo Soares on 04/05/22.
//

import Foundation

@testable import FinanceApp

final class HomeServiceStub: HomeServiceProtocol {
    var homeDataToBeReturned: HomeData?
    static func fetchHomeData(_ completion: @escaping (HomeData?) -> Void) {
        completion(MockHomeData.homeData)
    }
}

struct MockHomeData {
    static var homeData: HomeData? {
        if let fileURL = Bundle(for: HomeServiceTests.self).url(forResource: "homedatamock", withExtension: "json") {
            do {
                let data = try Data(contentsOf: fileURL)
                return try JSONDecoder().decode(HomeData.self, from: data)
            } catch {
                return nil
            }
        }
        return nil
    }
}
