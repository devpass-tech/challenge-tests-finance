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
    private let dispatchQueue: DispatchQueueProtocol

    init(financeService: FinanceServiceProtocol,
         dispatchQueue: DispatchQueueProtocol = DispatchQueue.main) {
        self.financeService = financeService
        self.dispatchQueue = dispatchQueue
    }

    func fetchData() {

        financeService.fetchActivityDetails { activityDetails in

            guard let activityDetails = activityDetails else {
                return
            }

            dispatchQueue.async(group: nil,
                                qos: .unspecified,
                                flags: []) {

                delegate?.didFetchActivityDetails(activityDetails)
            }
        }
    }
}
