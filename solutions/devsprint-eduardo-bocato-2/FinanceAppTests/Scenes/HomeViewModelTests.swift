import XCTest
@testable import FinanceApp

final class HomeViewModelTests: XCTestCase {
    // MARK: - Properties
    
    private var homeServiceStub = HomeServiceStub.self
    private let homeViewModelDelegateSpy: HomeViewModelDelegateSpy = .init()
    
    private lazy var sut: HomeViewModel = {
        var viewModel = HomeViewModel(
            homeService: homeServiceStub
        )
        viewModel.delegate = homeViewModelDelegateSpy
        return viewModel
    }()
    
    // MARK: - Tests
    
    func test_fetchData_whenServiceReturnsNil_didFetchHomeDataShouldNotBeCalled() {
        // Given
        let homeDataMock: HomeData? = nil
        homeServiceStub.dataToBeReturned = homeDataMock
        
        // When
        sut.fetchData()
        
        // Then
        XCTAssertNil(homeViewModelDelegateSpy.dataPassed)
        XCTAssertFalse(homeViewModelDelegateSpy.didFetchHomeDataCalled)
    }
    
    func test_fetchData_whenServiceReturnsValidData_didFetchHomeDataShouldBeCalled() {
        // Given
        let homeDataMock: HomeData = .fixture()
        homeServiceStub.dataToBeReturned = homeDataMock
        
        // When
        sut.fetchData()
        
        // Then
        XCTAssertNotNil(homeViewModelDelegateSpy.dataPassed)
        XCTAssertTrue(homeViewModelDelegateSpy.didFetchHomeDataCalled)
    }
}
