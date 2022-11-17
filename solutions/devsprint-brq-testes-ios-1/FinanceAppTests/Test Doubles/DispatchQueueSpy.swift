

import Foundation

@testable import FinanceApp

public class DispatchQueueSpy: DispatchQueueProtocol {
    public func async(group: DispatchGroup?, qos: DispatchQoS, flags: DispatchWorkItemFlags, execute work: @escaping @convention(block) () -> Void) {
        work()
    }
}
