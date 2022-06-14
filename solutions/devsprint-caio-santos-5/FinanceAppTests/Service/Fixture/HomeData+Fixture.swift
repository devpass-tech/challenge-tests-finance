@testable import FinanceApp

extension HomeData {
    static func fixture(
        balance: Float = 15459.27,
        savings: Float = 1000,
        spending: Float = 500,
        activity: [Activity] = [.fixture()]
    ) -> HomeData {
        .init(
            balance: balance,
            savings: savings,
            spending: spending,
            activity: activity
        )
    }
}
