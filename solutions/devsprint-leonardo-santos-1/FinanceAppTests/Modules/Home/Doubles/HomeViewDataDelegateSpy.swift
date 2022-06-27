@testable import FinanceApp

final class HomeViewDataDelegateSpy: HomeViewModelDelegate {
    
    private(set) var didFetchHomeDataTriggered: Bool = false
    private(set) var didFetchHomeDataCount: Int = 0
    var didFetchHomeDataReturn: HomeData? = .fixture()
    
    func didFetchHomeData(_ data: HomeData) {
        didFetchHomeDataCount += 1
        didFetchHomeDataTriggered = true
        didFetchHomeDataReturn = data
    }
    
    
}
