import Foundation

protocol DispatchQueueProtocol {
    func async(group: DispatchGroup?, qos: DispatchQoS, flags: DispatchWorkItemFlags, execute work: @escaping () -> Void)
}

extension DispatchQueueProtocol {
    func async(group: DispatchGroup? = nil, qos: DispatchQoS = .unspecified, flags: DispatchWorkItemFlags = [], execute work: @escaping () -> Void) {
        self.async(group: group, qos: qos, flags: flags, execute: work)
    }
}

extension DispatchQueue: DispatchQueueProtocol {}
