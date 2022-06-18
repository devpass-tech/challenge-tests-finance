import Foundation

struct UserProfile: Decodable, Equatable {
    let name: String
    let phone: String
    let email: String
    let address: String
    let account: Account
}

struct Account: Decodable, Equatable {
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
