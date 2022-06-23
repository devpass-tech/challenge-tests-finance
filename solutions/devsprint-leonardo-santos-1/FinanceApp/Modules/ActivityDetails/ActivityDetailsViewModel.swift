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
    private let mainDispatchQueue: DispatchQueueProtocol

    init(financeService: FinanceServiceProtocol,
         mainDispatchQueue: DispatchQueueProtocol = DispatchQueue.main) {
        self.financeService = financeService
        self.mainDispatchQueue = mainDispatchQueue
    }

    func fetchData() {

        financeService.fetchActivityDetails { activityDetails in

            guard let activityDetails = activityDetails else {
                return
            }

            mainDispatchQueue.async {

                delegate?.didFetchActivityDetails(activityDetails)
            }
        }
    }
}
