@testable import FinanceApp

extension UserProfile {
    static func fixture(
        name: String = "name",
        phone: String = "phone",
        email: String = "email",
        address: String = "address",
        account: Account = .fixture()
    ) -> UserProfile {
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
        agency: String = "agency",
        account: String = "account"
    ) -> Account {
        .init(
            agency: agency,
            account: account
        )
    }
}
