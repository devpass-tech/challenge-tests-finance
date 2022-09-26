
//
//  UserProfile+Fixture.swift
//  FinanceAppTests
//
//  Created by Giuliano Accorsi on 22/09/22.
//

import Foundation
@testable import FinanceApp

extension UserProfile {
    static func fixture(name: String = "Irma Flores",
                        phone: String = "",
                        email: String = "",
                        address: String = "",
                        agency: String = "",
                        account: String = ""

    ) -> Self {
        .init(name: name,
              phone: phone,
              email: email,
              address: address,
              account: Account(agency: agency, account: account))
    }
}
