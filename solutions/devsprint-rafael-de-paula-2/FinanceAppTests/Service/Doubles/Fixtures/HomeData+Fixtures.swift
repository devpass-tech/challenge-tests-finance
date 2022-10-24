//
//  HomeData+Fixtures.swift
//  FinanceAppTests
//
//  Created by Rafael de Paula on 21/10/22.
//

import Foundation
@testable import FinanceApp

extension HomeData {
    static func fixture(
        balance: Float = .random(in: 0...1000),
        savings: Float = .random(in: 0...1000),
        spending: Float = .random(in: 0...1000),
        activity: [Activity] = [.fixture()]
    ) -> Self {
        .init(
            balance: balance,
            savings: savings,
            spending: spending,
            activity: activity
        )
    }
}
