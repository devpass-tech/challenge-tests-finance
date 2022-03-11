//
//  ActivityDetailsViewModel.swift
//  FinanceApp
//
//  Created by Rodrigo Borges on 03/03/22.
//

import Foundation

protocol ActivityDetailsViewModelDelegate: AnyObject {

    func didFetchActivityDetails(_ data: ActivityDetails)
}

struct ActivityDetailsViewModel {

    weak var delegate: ActivityDetailsViewModelDelegate?

    private let financeService: FinanceServiceProtocol

    init(financeService: FinanceServiceProtocol) {
        self.financeService = financeService
    }

    func fetchData() {

        financeService.fetchActivityDetails { activityDetails in

            guard let activityDetails = activityDetails else {
                return
            }

            DispatchQueue.main.async {

                delegate?.didFetchActivityDetails(activityDetails)
            }
        }
    }
}
