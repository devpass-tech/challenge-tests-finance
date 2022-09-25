import Foundation
@testable import FinanceApp

class DispatchQueueSpy: DispatchQueueProtocol {
    // MARK: Properties
    var deadlinePassed: DispatchTime?
    var calledDispatchQueueAsync: Bool = false
    var calledDispatchQueueAsyncAfter: Bool = false

    // MARK: Methods
    func async(group: DispatchGroup? = nil,
               qos: DispatchQoS = .unspecified,
               flags: DispatchWorkItemFlags = [],
               execute work: @escaping @convention(block) () -> Void) {
        calledDispatchQueueAsync = true
        work()
    }

    func asyncAfter(deadline: DispatchTime,
                    qos: DispatchQoS = .unspecified,
                    flags: DispatchWorkItemFlags = [],
                    execute work: @escaping @convention(block) () -> Void) {
        deadlinePassed = deadline
        calledDispatchQueueAsyncAfter = true
        work()
    }
}
