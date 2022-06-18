import Foundation

protocol DispatchQueueProtocol {
    func async(_ work: @escaping () -> Void)
}

extension DispatchQueue: DispatchQueueProtocol {
    func async(_ work: @escaping () -> Void) {
        self.async(execute: {
            work()
        })
    }
}
