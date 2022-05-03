import Foundation

protocol HomeViewModelDelegate: AnyObject {
    func didFetchHomeData(_ data: HomeData)
}

struct HomeViewModel {
    weak var delegate: HomeViewModelDelegate?

    private let service: FinanceServiceProtocol

    init(with service: FinanceServiceProtocol) {
        self.service = service
    }

    func fetchData() {
        service.fetchHomeData { homeData in
            guard let homeData = homeData else { return }
//            DispatchQueue.main.async {
                self.delegate?.didFetchHomeData(homeData)
//            }
        }
    }
}
