//
//  ActivityDetailsViewModelDelegateSpy.swift
//  FinanceAppTests
//
//  Created by Bruno Silva on 28/09/22.
//

@testable import FinanceApp

import UIKit

final class ActivityDetailsViewModelDelegateSpy: ActivityDetailsViewModelDelegate {
    
    private(set) var didFetchActivityDetailsCalled: Bool = false
    
    func didFetchActivityDetails(_ data: ActivityDetails) {
        didFetchActivityDetailsCalled = true
    }
}
