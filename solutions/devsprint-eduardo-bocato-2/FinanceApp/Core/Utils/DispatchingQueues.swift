import Foundation

/// Describes something that can dispatch a work to be done.
protocol Dispatching {
    /// Dispatches the work to be done.
    /// - Parameter work: the work closure.
    func dispatch(_ work: @escaping () -> Void)
}

/// Describes a queue that will run asynchronously.
struct AsyncQueue: Dispatching {
    let queue: DispatchQueue
    init(queue: DispatchQueue) {
        self.queue = queue
    }
    
    func dispatch(_ work: @escaping ()->Void) {
        queue.async(execute: work)
    }
}
extension AsyncQueue {
    /// Same as DispatchQueue.main
    static let main: AsyncQueue = .init(queue: .main)
    /// Same as DispatchQueue.global()
    static let global: AsyncQueue = .init(queue: .global())
    /// Same as DispatchQueue.background
    static let background: AsyncQueue = .init(queue: .global(qos: .background))
}

/// Describes a queue that will run synchronously.
struct SyncQueue: Dispatching {
    let queue: DispatchQueue
    init(queue: DispatchQueue) {
        self.queue = queue
    }
    
    func dispatch(_ work: @escaping ()->Void) {
        queue.sync(execute: work)
    }
}
extension SyncQueue {
    /// Same as DispatchQueue.main
    static let main: SyncQueue = .init(queue: .main)
    /// Same as DispatchQueue.global()
    static let global: SyncQueue = .init(queue: .global())
    /// Same as DispatchQueue.background
    static let background: SyncQueue = .init(queue: .global(qos: .background))
}

#if DEBUG
import XCTestDynamicOverlay

final class FailingQueue: Dispatching {
    func dispatch(_ work: @escaping ()->Void) {
        XCTFail("FailingQueue always fails!")
    }
}
extension SyncQueue {
    /// A sync queue that always fails.
    static let failing: FailingQueue = .init()
}
extension AsyncQueue {
    /// An async queue that always fails.
    static let failing: FailingQueue = .init()
}
#endif
