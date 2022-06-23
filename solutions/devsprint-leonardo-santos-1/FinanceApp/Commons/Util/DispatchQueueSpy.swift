//
//  DispatchQueueSpy.swift
//  FinanceApp
//
//  Created by Leonardo Cunha on 22/06/22.
//

import Foundation

protocol DispatchQueueProtocol {
    func async(execute work: @escaping @convention(block) ()->Void)
}

final class DispatchQueueSpy: DispatchQueueProtocol {
    func async(execute work: @escaping @convention(block) ()->Void) {
        work()
    }
}
