//
//  ActivityDetailsViewModelDelegateSpy.swift
//  FinanceAppTests
//
//  Created by Hoff Silva on 2022-06-21.
//

import Foundation

@testable import FinanceApp

final class ActivityDetailsViewModelDelegateSpy: ActivityDetailsViewModelDelegate {
    
    private(set) var isActivityDetailsViewModeldelegateCalled = false
    private(set) var data: ActivityDetails?
    
    func didFetchActivityDetails(_ data: ActivityDetails) {
        self.isActivityDetailsViewModeldelegateCalled = true
        self.data = data
    }
    
}
