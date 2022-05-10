import Foundation

protocol TransfersServiceProtocol {
    func transferAmount(_ amount: Float, _ completion: @escaping (TransferResult?) -> Void)
}

extension FinanceService: TransfersServiceProtocol {}

#if DEBUG
struct TransfersServiceDummy: TransfersServiceProtocol {
    func transferAmount(_ amount: Float, _ completion: @escaping (TransferResult?) -> Void) {}
}


final class TransfersServiceStub: TransfersServiceProtocol {
    var transferAmountResultToBeReturned: TransferResult?
    func transferAmount(
        _ amount: Float, _
        completion: @escaping (TransferResult?) -> Void
    ) {
        completion(transferAmountResultToBeReturned)
    }
}
#endif
