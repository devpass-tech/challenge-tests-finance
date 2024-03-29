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
    
    private let financeService: FinanceServiceHomeProtocol
    private let dispatchQueue: DispatchQueueProtocol
    
    init(
        financeService: FinanceServiceHomeProtocol,
        dispatchQueue: DispatchQueueProtocol = DispatchQueue.main) {
            self.financeService = financeService
            self.dispatchQueue = dispatchQueue
    }
    
    func fetchData() {
        
        financeService.fetchHomeData { homeData in
            
            guard let homeData = homeData else {
                return
            }
            
            dispatchQueue.async(group: nil, qos: .unspecified, flags: []) {
                delegate?.didFetchHomeData(homeData)
            }
        }
    }
}
