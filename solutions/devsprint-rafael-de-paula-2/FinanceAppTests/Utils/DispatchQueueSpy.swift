//
//  DispatchQueueSpy.swift
//  FinanceAppTests
//
//  Created by Rafael de Paula on 25/10/22.
//

import Foundation
@testable import FinanceApp

final class DispatchQueueSpy: DispatchQueueProtocol {
    
    private(set) var calledDispatchQueueAsync: Bool = false
    
    func async(execute work: @escaping @convention(block) () -> Void) {
        calledDispatchQueueAsync = true
        work()
    }
}

