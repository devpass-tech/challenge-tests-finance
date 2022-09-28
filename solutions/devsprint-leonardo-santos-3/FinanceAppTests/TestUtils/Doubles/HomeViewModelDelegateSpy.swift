import XCTest

@testable import FinanceApp

final class HomeViewModelDelegateSpy: HomeViewModelDelegate {
    private(set) var didFetchHomeDataCalled: Bool = false
    private(set) var dataPassed: HomeData?
    
    func didFetchHomeData(_ data: HomeData) {
        didFetchHomeDataCalled = true
        
        self.dataPassed = data
    }
}
