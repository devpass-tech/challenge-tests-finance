@testable import FinanceApp

extension HomeData {
    static func fixture(
        balance: Float, savings: Float, spending: Float, activity: [Activity]
    ) -> Self{
        .init(
            balance: balance, savings: savings, spending: spending, activity: activity
        )
    }
}
