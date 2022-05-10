import Foundation

struct UserProfileViewData {
    let name: String
    let phone: String
    let email: String
    let address: String
    let agency: String
    let account: String
}

struct UserProfileViewDataMapper {
    let map: (UserProfile) -> UserProfileViewData
}
extension UserProfileViewDataMapper {
    static let live: Self = .init { entity in
        return .init(
            name: entity.name,
            phone: PhoneNumberFormatter.format(entity.phone),
            email: entity.email,
            address: entity.address,
            agency: entity.account.formattedAgency(),
            account: entity.account.formattedAccount()
        )
    }
}
