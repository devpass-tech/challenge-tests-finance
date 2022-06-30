//
//  HomeData+Fixture.swift
//  FinanceAppTests
//
//  Created by Leonardo Cunha on 25/06/22.
//

import Foundation
@testable import FinanceApp

extension HomeData {
    static func fixture(balance: Float = 0,
                         savings: Float = 0,
                         spending: Float = 0,
                         activity: [Activity] = []) -> Self {
        .init(balance: balance,
                 savings: savings,
                 spending: spending,
                 activity: activity)
    }
}
