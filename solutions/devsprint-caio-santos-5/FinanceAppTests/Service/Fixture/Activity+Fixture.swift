@testable import FinanceApp

extension Activity {
    static func fixture(
        name: String = "Mall",
        price: Float = 100,
        time: String = "8:57 AM"
    ) -> Activity {
        .init(
            name: name,
            price: price,
            time: time
        )
    }
}
