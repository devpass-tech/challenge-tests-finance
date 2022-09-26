import XCTest

@testable import FinanceApp

final class HomeViewModelDelegateSpy: HomeViewModelDelegate {
    private(set) var didFetchHomeDataCalled: Bool = false
    
    func didFetchHomeData(_ data: HomeData) {
        didFetchHomeDataCalled = true
    }
}
