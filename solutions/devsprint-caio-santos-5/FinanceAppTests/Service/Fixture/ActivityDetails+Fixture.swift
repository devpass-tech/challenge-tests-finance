@testable import FinanceApp

extension ActivityDetails {
    static func fixture(
        name: String = "Mall",
        price: Float = 100.0,
        category: String = "Shopping",
        time: String = "8:57 AM"
    ) -> ActivityDetails {
        .init(
            name: name,
            price: price,
            category: category,
            time: time
        )
    }
}
