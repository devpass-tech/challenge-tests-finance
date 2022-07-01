//
//  DispatchQueueSpy.swift
//  FinanceApp
//
//  Created by Leonardo Cunha on 22/06/22.
//

import Foundation
@testable import FinanceApp

final class DispatchQueueSpy: DispatchQueueProtocol {
    private(set) var asyncCalled: Bool = false
    private(set) var asyncCalledCount: Int = 0
    
    func async(execute work: @escaping @convention(block) ()->Void) {
        asyncCalledCount += 1
        asyncCalled = true
        work()
    }
}
