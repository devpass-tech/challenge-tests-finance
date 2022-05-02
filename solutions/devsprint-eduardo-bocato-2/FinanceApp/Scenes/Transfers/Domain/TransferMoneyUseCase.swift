import Foundation
import Combine

struct TransferMoneyUseCase {
    enum Error: Swift.Error {
        case invalidInput
        case serviceError
    }
    
    let execute: (String) -> AnyPublisher<Bool, Error>
}
extension TransferMoneyUseCase {
    static func live() -> Self {
        .init(
            execute: { amountString in
                let future = Future<Bool, Error> { promise in
                    
                    guard let amount = Float(amountString) else {
                        promise(.failure(.invalidInput))
                        return
                    }
                    
                    FinanceService().transferAmount(amount) { result in
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
