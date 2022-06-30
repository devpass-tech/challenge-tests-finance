//
//  DispatchQueue+Extensions.swift
//  FinanceApp
//
//  Created by Leonardo Cunha on 23/06/22.
//

import Foundation

protocol DispatchQueueProtocol {
    func async(execute work: @escaping @convention(block) ()->Void)
}

extension DispatchQueue: DispatchQueueProtocol {
    func async(execute work: @escaping @convention(block) ()->Void) {
        async(group: nil, qos: .unspecified, flags: [], execute: work)
    }
}

