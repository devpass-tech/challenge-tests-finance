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

protocol DispatchQueueProtocol {
    func async(group: DispatchGroup?, qos: DispatchQoS, flags: DispatchWorkItemFlags, execute work: @escaping @convention(block) () -> Void)
}

struct HomeViewModel {

    weak var delegate: HomeViewModelDelegate?
    private let dispatchQueue: DispatchQueueProtocol

    private let financeService: FetchHomeDataProtocol

    init(financeService: FetchHomeDataProtocol, dispatchQueue: DispatchQueueProtocol) {
        self.financeService = financeService
        self.dispatchQueue = dispatchQueue
    }

    func fetchData() {

        financeService.fetchHomeData { homeData in

            guard let homeData = homeData else {
                return
            }

            dispatchQueue.async(group: nil, qos: .background, flags: .noQoS) {
                
                delegate?.didFetchHomeData(homeData)
            }
        }
    }
}

extension DispatchQueue: DispatchQueueProtocol {}
