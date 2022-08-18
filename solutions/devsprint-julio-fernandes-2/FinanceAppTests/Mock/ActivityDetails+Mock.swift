//
//  ActivityDetails+Mock.swift
//  FinanceAppTests
//
//  Created by Thiago Cezario on 18/08/22.
//

import Foundation
@testable import FinanceApp

extension ActivityDetails {
    static func mock(
        name: String = "Netflix",
        price: Float = 10.0,
        category: String = "Hobby",
        time: String = "14:00"
    ) -> Self {
        return .init(
            name: name,
            price: price,
            category: category,
            time: time)
    }
}
