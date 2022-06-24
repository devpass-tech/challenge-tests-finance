//
//  FixtureActivityDetails.swift
//  FinanceAppTests
//
//  Created by Filipe Simoes Teodoro on 24/06/22.
//

@testable import FinanceApp
extension ActivityDetails {
    static func fixture(name: String = "",
                        price: Float = 0.0,
                        category: String = "",
                        time: String = "") -> Self {
        .init(name: name,
              price: price,
              category: category,
              time: time)
    }
}
