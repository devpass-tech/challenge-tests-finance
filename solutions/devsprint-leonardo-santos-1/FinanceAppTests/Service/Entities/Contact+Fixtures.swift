//
//  Contact+Fixtures.swift
//  FinanceAppTests
//
//  Created by Leonardo Cunha on 23/06/22.
//

import XCTest
@testable import FinanceApp

extension Contact {
    static func fixture(name: String = "",
                        phone: String = "") -> Contact {
        Contact(name: name,
                phone: phone)
    }
}
