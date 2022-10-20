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

        financeService.fetchActivityDetails { result in
            switch result {
            case .success(let content):
                DispatchQueue.main.async {
                    delegate?.didFetchActivityDetails(content)
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
