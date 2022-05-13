import Foundation

struct UserProfile: Decodable, Equatable {
    internal init(name: String, phone: String, email: String, address: String, account: Account) {
        self.name = name
        self.phone = phone
        self.email = email
        self.address = address
        self.account = account
    }
    
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

#if DEBUG
extension UserProfile {
    static func fixture(
        name: String = "John",
        phone: String = "06 1234 1234",
        email: String = "email@email.com",
        address: String = "Street, 123",
        account: Account = .fixture()
    ) -> Self {
        .init(
            name: name,
            phone: phone,
            email: email,
            address: address,
            account: account
        )
    }
}

extension Account {
    static func fixture(
        agency: String = "1234",
        account: String = "098765"
    ) -> Self {
        .init(
            agency: agency,
            account: account
        )
    }
}

#endif
