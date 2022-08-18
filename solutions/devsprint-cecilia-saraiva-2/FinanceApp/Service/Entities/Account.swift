//
//  Account.swift
//  FinanceApp
//
//  Created by Henrique Augusto on 16/08/22.
//

import Foundation

struct Account: Decodable {

    let agency: String
    let account: String
}

extension Account {

    func formattedAgency() -> String {

        return "Agency: \(agency)"
    }

    func formattedAccount() -> String {

        return "Account: \(account)"
    }
}
