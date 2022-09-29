@testable import FinanceApp

extension Contact {
    static func fixture(name: String = "", phone: String = "") -> Self {
        .init(name: name, phone: phone)
    }
}
