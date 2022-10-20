//
//  Result+Extensions.swift
//  FinanceAppTests
//
//  Created by Rafael de Paula on 20/10/22.
//

import Foundation

extension Result {
    var isSuccess: Bool {
        switch self {
        case .success:
            return true
        case .failure:
            return false
        }
    }
    
    var isFailure: Bool {
        !isSuccess
    }
    
    var value: Success? {
        try? get()
    }
    
    var error: Error? {
        switch self {
        case .success:
            return nil
        case .failure(let error):
            return error
        }
    }
}
