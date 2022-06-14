@testable import FinanceApp
import Foundation
import XCTest

final class DispatchQueueMock: DispatchQueueProtocol {
    var asyncImpl: (_ group: DispatchGroup?, _ qos: DispatchQoS, _ flags: DispatchWorkItemFlags, _ work: @escaping () -> Void) -> Void = { _, _, _, _  in
        XCTFail("asyncImpl not implemented")
    }
    
    func async(group: DispatchGroup?, qos: DispatchQoS, flags: DispatchWorkItemFlags, execute work: @escaping () -> Void) {
        asyncImpl(group, qos, flags, work)
    }
}
