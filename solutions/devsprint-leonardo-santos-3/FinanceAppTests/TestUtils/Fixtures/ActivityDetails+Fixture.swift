//
//  ActivityDetails+Fixture.swift
//  FinanceAppTests
//
//  Created by Pedro Gabriel on 21/09/22.
//

@testable import FinanceApp

extension ActivityDetails {
    static func fixture(name: String,
                        price: Float,
                        category: String,
                        time: String) -> Self {
        .init(name: name,
              price: price,
              category: category,
              time: time)
    }
}
