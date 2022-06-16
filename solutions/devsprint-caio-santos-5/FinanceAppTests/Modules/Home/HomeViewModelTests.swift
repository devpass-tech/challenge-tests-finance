import Foundation
@testable import FinanceApp
import XCTest

final class HomeViewModelTests: XCTestCase {
    typealias Sut = HomeViewModel
    
    func test_fetchData_ShouldReturnValidData() {
        // Given
        let fakeApi = FinanceServiceMock()
        let delegateMock = HomeViewModelDelegateMock()
        let queue = DispatchQueueMock()
        var callOrder = [String]()
        var queueAction: (() -> Void)?
        var serviceAction: (() -> Void)?
        
        queue.asyncImpl = { completion in
            queueAction = { completion() }
            callOrder.append("queue called")
        }
        
        fakeApi.fetchHomeDataImpl = { completion in
            serviceAction = { completion(.fixture()) }
            callOrder.append("service called")
        }
        
        delegateMock.didFetchHomeDataImpl = {
            XCTAssertEqual($0, .fixture())
            callOrder.append("delegate called")
        }
        
        var sut = Sut(financeService: fakeApi, queue: queue)
        sut.delegate = delegateMock
        
        // When
        sut.fetchData()
        
        // Then
        XCTAssertEqual(callOrder, ["service called"])
        
        serviceAction?()
        
        XCTAssertEqual(callOrder, ["service called", "queue called"])
        
        queueAction?()
        
        XCTAssertEqual(callOrder, ["service called", "queue called", "delegate called"])
    }
    
    func test_fetchData_ShouldReturnNilData() {
        // Given
        let fakeApi = FinanceServiceMock()
        let delegateMock = HomeViewModelDelegateMock()
        let queue = DispatchQueueMock()
        var callOrder = [String]()
        var serviceAction: (() -> Void)?
        
        fakeApi.fetchHomeDataImpl = { completion in
            serviceAction = { completion(nil) }
            callOrder.append("service called")
        }
        
        var sut = Sut(financeService: fakeApi, queue: queue)
        sut.delegate = delegateMock
        
        // When
        sut.fetchData()
        
        // Then
        XCTAssertEqual(callOrder, ["service called"])
        
        serviceAction?()
        
        XCTAssertEqual(callOrder, ["service called"])
    }
    
    func test_Sut_ShouldNotKeepStrongReferenceToDelegate() {
        // Given
        let fakeApi = FinanceServiceMock()
        var delegateMock: HomeViewModelDelegateMock? = .init()
        let queue = DispatchQueueMock()
        
        var sut = Sut(financeService: fakeApi, queue: queue)
        sut.delegate = delegateMock
        
        // When
        delegateMock = nil
        
        // Then
        XCTAssertNil(delegateMock)
    }
}

final class HomeViewModelDelegateMock: HomeViewModelDelegate {
    var didFetchHomeDataImpl: ((_ data: HomeData) -> Void) = { _ in
        XCTFail("didFetchHomeData should not be called")
    }
    
    func didFetchHomeData(_ data: HomeData) {
        didFetchHomeDataImpl(data)
    }
}
