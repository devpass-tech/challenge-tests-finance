//
//  HomeDataFixture.swift
//  FinanceAppTests
//
//  Created by Junior Margalho on 22/06/22.
//

@testable import FinanceApp
import Foundation

extension HomeData {
    static func fixture(
        balance: Float = 0,
        savings: Float = 0,
        spending: Float = 0,
        activity: [Activity] = []
    ) -> HomeData {
        .init(balance: balance,
              savings: savings,
              spending: spending,
              activity: activity
        )
    }
}
