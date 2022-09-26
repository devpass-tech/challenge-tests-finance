import Foundation
@testable import FinanceApp

final class DispatchQueueSpy: DispatchQueueProtocol {
    // MARK: Properties
    private(set) var calledDispatchQueueAsync: Bool = false

    // MARK: Methods
    func async(group: DispatchGroup? = nil,
               qos: DispatchQoS = .unspecified,
               flags: DispatchWorkItemFlags = [],
               execute work: @escaping @convention(block) () -> Void) {
        calledDispatchQueueAsync = true
        work()
    }

    // MARK: Properties
    private(set) var deadlinePassed: DispatchTime?
    private(set) var calledDispatchQueueAsyncAfter: Bool = false

    // MARK: Methods
    func asyncAfter(deadline: DispatchTime,
                    qos: DispatchQoS = .unspecified,
                    flags: DispatchWorkItemFlags = [],
                    execute work: @escaping @convention(block) () -> Void) {
        deadlinePassed = deadline
        calledDispatchQueueAsyncAfter = true
        work()
    }
}
