//
//  Contact+Fixtures.swift
//  FinanceAppTests
//
//  Created by Débora Lage on 25/10/22.
//

import Foundation
@testable import FinanceApp

extension Contact {
    static func fixture(
        name: String = .random(),
        phone: String = .random()
    ) -> Self {
        .init(
            name: name,
            phone: phone
        )
    }
}
