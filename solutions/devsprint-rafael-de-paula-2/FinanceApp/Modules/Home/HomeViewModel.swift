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

    init(financeService: FinanceServiceProtocol) {
        self.financeService = financeService
    }

    func fetchData() {
        financeService.fetchHomeData { result in
            switch result {
            case .success(let content):
                DispatchQueue.main.async {
                    delegate?.didFetchHomeData(content)
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
