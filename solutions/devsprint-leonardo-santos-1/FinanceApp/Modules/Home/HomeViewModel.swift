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

protocol FinanceServiceHomeProtocol: AnyObject {
    
    func fetchHomeData(_ completion: @escaping (HomeData?) -> Void)
}

struct HomeViewModel {

    weak var delegate: HomeViewModelDelegate?

    private let financeService: FinanceServiceHomeProtocol
    private let mainDispatchQueue: DispatchQueueProtocol

    init(financeService: FinanceServiceHomeProtocol,
         mainDispatchQueue: DispatchQueueProtocol = DispatchQueue.main) {
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
