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

#if DEBUG
import XCTestDynamicOverlay

extension UserProfileViewDataMapper {
    static let failing: Self = .init(
        map: { _ in
            XCTFail("UserProfileViewDataMapper.map was not implemented.")
            return .fixture()
        }
    )
}
#endif

#if DEBUG
extension UserProfileViewData {
    static func fixture(
        name: String = "name",
        phone: String = "phone",
        email: String = "email",
        address: String = "address",
        agency: String = "agency",
        account: String = "account"
    ) -> Self {
        .init(
            name: name,
            phone: phone,
            email: email,
            address: address,
            agency: agency,
            account: account
        )
    }
}

#endif
