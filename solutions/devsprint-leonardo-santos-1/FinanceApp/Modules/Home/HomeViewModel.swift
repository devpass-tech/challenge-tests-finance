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
    private let mainDispatchQueue: DispatchQueueProtocol

    init(
        financeService: FinanceServiceHomeDataProtocol,
        mainDispatchQueue: DispatchQueueProtocol = DispatchQueue.main
    ) {
        self.financeService = financeService
        self.mainDispatchQueue = mainDispatchQueue
    }

    func fetchData() {

        financeService.fetchHomeData { homeData in
            guard let homeData = homeData else {
                return
            }
            
            mainDispatchQueue.async {
                delegate?.didFetchHomeData(homeData)
            }
        }
    }
}
