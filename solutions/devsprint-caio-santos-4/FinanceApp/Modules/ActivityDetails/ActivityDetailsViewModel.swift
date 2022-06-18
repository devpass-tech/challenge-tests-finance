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
    private let queue: DispatchQueueProtocol
    
    init(financeService: FinanceServiceProtocol, queue: DispatchQueueProtocol) {
        self.financeService = financeService
        self.queue = queue
    }

    func fetchData() {
        financeService.fetchActivityDetails { activityDetails in
            guard let activityDetails = activityDetails else {
                return
            }
            
            queue.async {
                delegate?.didFetchActivityDetails(activityDetails)
            }
        }
    }
}
