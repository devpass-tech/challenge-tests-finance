import Foundation

protocol HomeViewModelDelegate: AnyObject {
    func didFetchHomeData(_ data: HomeData)
}

struct HomeViewModel {
    weak var delegate: HomeViewModelDelegate?
    
    private let homeService: HomeServiceProtocol.Type
    
    init(homeService: HomeServiceProtocol.Type = FinanceService.self) {
        self.homeService = homeService
    }

    func fetchData() {
        homeService.fetchHomeData { homeData in
            guard let homeData = homeData else { return }
            self.delegate?.didFetchHomeData(homeData)
        }
    }
}

#if DEBUG
final class HomeViewModelDelegateSpy: HomeViewModelDelegate {
    private(set) var didFetchHomeDataCalled = false
    private(set) var dataPassed: HomeData?
    
    init() {}
    
    func didFetchHomeData(_ data: HomeData) {
        didFetchHomeDataCalled = true
        dataPassed = data
    }
}
#endif
