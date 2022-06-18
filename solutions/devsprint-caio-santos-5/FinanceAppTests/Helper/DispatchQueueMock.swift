@testable import FinanceApp
import Foundation
import XCTest

final class DispatchQueueMock: DispatchQueueProtocol {
    var asyncImpl: (_ work: @escaping () -> Void) -> Void = { _ in
        XCTFail("asyncImpl not implemented")
    }
    
    func async(_ work: @escaping () -> Void) {
        asyncImpl(work)
    }
}
