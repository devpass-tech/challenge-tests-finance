import Foundation

public struct Home: Equatable {
    public let balance: Decimal
    public let savings: Decimal
    public let spending: Decimal

    public init(
        balance: Decimal,
        savings: Decimal,
        spending: Decimal
    ) {
        self.balance = balance
        self.savings = savings
        self.spending = spending
    }
}
