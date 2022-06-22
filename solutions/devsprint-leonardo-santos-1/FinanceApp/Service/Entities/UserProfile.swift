//
//  UserProfile.swift
//  FinanceApp
//
//  Created by Rodrigo Borges on 02/03/22.
//

import Foundation

struct UserProfile: Codable, Equatable {

    let name: String
    let phone: String
    let email: String
    let address: String
    let account: Account
}

struct Account: Codable, Equatable {

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
