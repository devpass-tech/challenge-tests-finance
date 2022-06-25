//
//  ActivityDetails+Fixture.swift
//  FinanceAppTests
//
//  Created by Leonardo Cunha on 25/06/22.
//

import Foundation
@testable import FinanceApp

extension ActivityDetails {
    static func fixture(name: String = "",
                        price: Float = 0,
                        category: String = "",
                        time: String = "") -> Self {
        .init(name: name,
              price: price,
              category: category,
              time: time)
    }
}
