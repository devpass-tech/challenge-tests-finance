import Foundation

protocol HomeViewModelDelegate: AnyObject {
    func didFetchHomeData(_ data: HomeData)
}

struct HomeViewModel {
    weak var delegate: HomeViewModelDelegate?

    private let financeService: FinanceServiceProtocol
    private let queue: DispatchQueueProtocol

    init(financeService: FinanceServiceProtocol, queue: DispatchQueueProtocol = DispatchQueue.main) {
        self.financeService = financeService
        self.queue = queue
    }

    func fetchData() {
        financeService.fetchHomeData { homeData in
            guard let homeData = homeData else { return }
            queue.async {
                delegate?.didFetchHomeData(homeData)
            }
        }
    }
}
