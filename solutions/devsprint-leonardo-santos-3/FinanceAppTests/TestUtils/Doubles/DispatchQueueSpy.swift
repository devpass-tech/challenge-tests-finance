import XCTest

@testable import FinanceApp

final class DispatchQueueSpy: DispatchQueueProtocol {
    
    private(set) var asyncCalled: Bool = false
    
    func async(group: DispatchGroup?, qos: DispatchQoS, flags: DispatchWorkItemFlags, execute work: @escaping @convention(block) () -> Void) {
        asyncCalled = true
        work()
    }
}
