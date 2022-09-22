@testable import FinanceApp

extension TransferResult {
    static func fixture(
        success: Bool = true
    ) -> Self{
        .init(
            success: success
        )
    }
}
