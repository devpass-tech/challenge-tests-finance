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
        name: String = "Pandora",
        phone: String = "+55 (31) 99999-5555"
    ) -> Self {
        .init(
            name: name,
            phone: phone
        )
    }
}
