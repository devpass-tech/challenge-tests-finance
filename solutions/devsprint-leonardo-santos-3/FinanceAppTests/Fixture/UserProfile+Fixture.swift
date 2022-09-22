
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
                        phone: String = "+55 (11) 99999-9999",
                        email: String = "irma@devpass.com.br",
                        address: String = "Rua Bela Cintra, 495",
                        agency: String = "0001",
                        account: String = "123456-7"

    ) -> Self {
        .init(name: name,
              phone: phone,
              email: email,
              address: address,
              account: Account(agency: agency, account: account))
    }
}
