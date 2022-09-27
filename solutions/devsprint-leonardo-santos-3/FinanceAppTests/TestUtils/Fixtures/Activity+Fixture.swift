@testable import FinanceApp

extension Activity {
    static func fixture(name: String = "",
                        price: Float = 0.0,
                        time: String = "") -> Self {
        .init(name: name,
              price: price,
              time: time)
    }
}
