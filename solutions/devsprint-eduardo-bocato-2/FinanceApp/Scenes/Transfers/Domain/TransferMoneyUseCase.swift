import Foundation
import Combine

struct TransferMoneyUseCase {
    enum Error: Swift.Error, Equatable {
        case invalidInput
        case serviceError
    }
    
    let execute: (String) -> AnyPublisher<Bool, Error>
}

extension TransferMoneyUseCase {
    static let live: Self = .instantiate(transferService: FinanceService())
    
    static func instantiate(transferService: TransfersServiceProtocol) -> Self {
        .init(
            execute: { amountString in
                let future = Future<Bool, Error> { promise in
                    
                    guard let amount = Float(amountString) else {
                        promise(.failure(.invalidInput))
                        return
                    }
                    
                    transferService.transferAmount(amount) { result in
                        guard let result = result else {
                            promise(.failure(.serviceError))
                            return
                        }
                        
                        promise(.success(result.success))
                    }
                }
                return future.eraseToAnyPublisher()
            }
        )
    }
}

#if DEBUG
extension TransferMoneyUseCase {
    static func stub(returning result: Result<Bool, Error>) -> Self {
        .init(execute: { _ in result.publisher.eraseToAnyPublisher() })
    }
}
#endif
