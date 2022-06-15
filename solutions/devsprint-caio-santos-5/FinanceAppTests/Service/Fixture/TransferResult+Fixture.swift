//
//  TransferResult+Fixture.swift
//  FinanceAppTests
//
//  Created by Rodrigo Francischett Occhiuto on 15/06/22.
//

@testable import FinanceApp

extension TransferResult {
    static func fixture(
        success: Bool = true
    ) -> TransferResult {
        .init(
            success: success
        )
    }
}
