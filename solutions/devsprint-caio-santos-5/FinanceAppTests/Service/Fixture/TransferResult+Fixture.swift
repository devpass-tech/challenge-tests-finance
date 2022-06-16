@testable import FinanceApp

extension TransferResult {
    static func fixture(
        success: Bool = true
    ) -> TransferResult {
        .init(
            success: success
        )
    }
}
