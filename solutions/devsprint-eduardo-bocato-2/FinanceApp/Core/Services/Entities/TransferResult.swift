import Foundation

struct TransferResult: Decodable {
    let success: Bool
}

#if DEBUG
extension TransferResult {
    static func fixture(
        success: Bool = true
    ) -> Self {
        .init(
            success: success
        )
    }
}
#endif
