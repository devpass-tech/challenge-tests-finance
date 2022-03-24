//
//  ActivityDetailsViewModelDelegateMock.swift
//  FinanceAppTests
//
//  Created by Murillo R. Araújo on 24/03/22.
//

import Foundation
@testable import FinanceApp

class ActivityDetailsViewModelDelegateMock: ActivityDetailsViewModelDelegate {

    var displayedActivityDetails = false

    func didFetchActivityDetails(_ data: ActivityDetails) {
        displayedActivityDetails = true
    }
}
