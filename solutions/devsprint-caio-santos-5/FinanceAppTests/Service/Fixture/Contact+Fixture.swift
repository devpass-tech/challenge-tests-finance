@testable import FinanceApp

extension Contact {
    static func fixture(
        name: String = "Ronald Robertson",
        phone: String = "+55 (11) 99999-9999"
    ) -> Contact {
        .init(
            name: name,
            phone: phone
        )
    }
}
