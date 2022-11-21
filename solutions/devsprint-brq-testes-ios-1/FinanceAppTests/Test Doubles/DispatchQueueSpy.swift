

import Foundation

@testable import FinanceApp

public class DispatchQueueSpy: DispatchQueueProtocol {
    
    var isDispatchCalled: Bool = false
    
    public func async(group: DispatchGroup?, qos: DispatchQoS, flags: DispatchWorkItemFlags, execute work: @escaping @convention(block) () -> Void) {
        isDispatchCalled = true
        work()
    }
}

