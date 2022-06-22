//
//  DispatchQueueSpy.swift
//  FinanceApp
//
//  Created by Leonardo Cunha on 22/06/22.
//

import Foundation

protocol DispatchQueueProtocol {
    func async()
}

final class DispatchQueueSpy: DispatchQueueProtocol {
    func async() {
        <#code#>
    }
}

extension DispatchQueue: DispatchQueueProtocol {
    func async() {
        <#code#>
    }
}



