//
//  DispatchQueue+Extensions.swift
//  FinanceApp
//
//  Created by Pedro Gabriel on 25/09/22.
//

import Foundation

protocol DispatchQueueProtocol {
    func async(group: DispatchGroup?,
               qos: DispatchQoS,
               flags: DispatchWorkItemFlags,
               execute work: @escaping @convention(block) () -> Void)

    func asyncAfter(deadline: DispatchTime,
                    qos: DispatchQoS,
                    flags: DispatchWorkItemFlags,
                    execute work: @escaping @convention(block) () -> Void)
}

extension DispatchQueue: DispatchQueueProtocol {}
