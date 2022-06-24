@testable import FinanceApp

extension HomeData {
    static func fixture (
    balance: Float = 0,
    savings: Float = 0,
    spending: Float = 0,
    activity: [Activity] = []
    ) -> HomeData {
        .init(
            balance: balance,
            savings: savings,
            spending: spending,
            activity: activity)
    }
}
