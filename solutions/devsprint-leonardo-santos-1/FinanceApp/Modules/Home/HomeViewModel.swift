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

    private let financeService: FinanceServiceHomeDataProtocol

    init(financeService: FinanceServiceHomeDataProtocol) {
        self.financeService = financeService
    }

    func fetchData() {

        financeService.fetchHomeData { homeData in

            guard let homeData = homeData else {
                return
            }
                delegate?.didFetchHomeData(homeData)
        }
    }
}
