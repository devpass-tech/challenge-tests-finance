import Foundation

protocol HomeViewModelDelegate: AnyObject {
    func didFetchHomeData(_ data: HomeData)
}

struct HomeViewModel {
    weak var delegate: HomeViewModelDelegate?

    func fetchData() {
        HomeService.fetchHomeData { homeData in
            guard let homeData = homeData else { return }
            DispatchQueue.main.async {
                self.delegate?.didFetchHomeData(homeData)
            }
        }
    }
}
