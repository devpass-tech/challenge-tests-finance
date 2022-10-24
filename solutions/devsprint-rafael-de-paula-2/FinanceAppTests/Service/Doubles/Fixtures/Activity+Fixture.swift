//
//  Activity+Fixture.swift
//  FinanceAppTests
//
//  Created by Rafael de Paula on 21/10/22.
//

import Foundation
@testable import FinanceApp

extension Activity {
    static func fixture(
        name: String = .random(),
        price: Float = .random(in: 0...1000),
        time: String = .random()
    ) -> Self {
        .init(
            name: name,
            price: price,
            time: time
        )
    }
}
