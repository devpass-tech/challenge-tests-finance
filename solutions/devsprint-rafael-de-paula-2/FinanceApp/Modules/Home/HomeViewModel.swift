//
//  HomeViewModel.swift
//  FinanceApp
//
//  Created by Rodrigo Borges on 03/03/22.
//

import Foundation

protocol HomeViewModelDelegate: AnyObject {
    func didFetchHomeData(_ data: HomeData)
}

struct HomeViewModel {

    weak var delegate: HomeViewModelDelegate?

    private let financeService: FinanceServiceProtocol
    private let dispatchQueue: DispatchQueueProtocol

    init(
        financeService: FinanceServiceProtocol,
        dispatchQueue: DispatchQueueProtocol = DispatchQueue.main
    ) {
        self.financeService = financeService
        self.dispatchQueue = dispatchQueue
    }

    func fetchData() {
        financeService.fetchHomeData { result in
            switch result {
            case .success(let content):
                dispatchQueue.async {
                    delegate?.didFetchHomeData(content)
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
