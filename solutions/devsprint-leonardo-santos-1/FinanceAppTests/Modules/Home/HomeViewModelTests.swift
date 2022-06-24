import XCTest
@testable import FinanceApp

class HomeViewModelTests: XCTestCase {

    private let financeServiceSpy = FinanceServiceSpy()
    private let delegateSpy = HomeViewDataDelegateSpy()
    private lazy var sut : HomeViewModel = {
        var homeViewModel = HomeViewModel(financeService: financeServiceSpy)
        homeViewModel.delegate = delegateSpy
        return homeViewModel
    }()
    
    func test_fecthData_shouldTriggerFetchHomeData() {
        sut.fetchData()
        XCTAssertTrue(financeServiceSpy.fetchHomeDataTriggered)
    }
    
    func test_fetchData_shouldTriggerFetchHomeDataOnce() {
        sut.fetchData()
        XCTAssertEqual(financeServiceSpy.fecthHomeDataCount, 1)
    }
    
    func test_fetchData_ifHomeDataIsNil_shouldNotTriggerDelegate() {
        financeServiceSpy.fetchHomeDataReturned = nil
        sut.fetchData()
        XCTAssertEqual(delegateSpy.didFetchHomeDataCount, 0)
    }
    
    func test_fecthData_ifHomeDataIsNotNil_shouldTriggerDelegate() {
        financeServiceSpy.fetchHomeDataReturned = .fixture()
        sut.fetchData()
        XCTAssertTrue(delegateSpy.didFetchHomeDataTriggered)
    }
    
    func test_fecthData_ifHomeDataIsNotNil_shouldTriggerDelegateOnce() {
        financeServiceSpy.fetchHomeDataReturned = .fixture()
        sut.fetchData()
        XCTAssertEqual(delegateSpy.didFetchHomeDataCount, 1)
    }
}
