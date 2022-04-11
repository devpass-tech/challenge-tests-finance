//
//  HomeData+Fixture.swift
//  FinanceAppTests
//
//  Created by vinicius.carvalho on 11/04/22.
//

import Foundation

@testable import FinanceApp

extension HomeData {
    static func fixture(
        balance: Float = 20.4,
        savings: Float = 10.22,
        spending: Float = 9.94,
        activity: [Activity] = []
    ) -> HomeData {
        return HomeData(
            balance: balance,
            savings: savings,
            spending: spending,
            activity: activity
        )
    }

    static func fixture(json: String) -> HomeData {
        return try! JSONDecoder().decode(HomeData.self, from: Data(json.utf8))
    }
}

extension Activity {
    static func fixture(
        name: String = "Supermakert Dia",
        price: Float = 12.4,
        time: String = "11:57"
    ) -> Activity {
        return Activity(
            name: "Supermarket The Day",
            price: 12.43,
            time: "11:46"
        )
    }
}
