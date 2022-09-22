struct Account: Decodable, Equatable {
    let agency: String
    let account: String
}

extension Account {
    func formattedAgency() -> String {
        "Agency: \(agency)"
    }

    func formattedAccount() -> String {
        "Account: \(account)"
    }
}
