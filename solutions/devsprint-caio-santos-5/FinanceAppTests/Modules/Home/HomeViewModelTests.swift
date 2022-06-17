import Foundation
@testable import FinanceApp
import XCTest

final class HomeViewModelTests: XCTestCase {
    typealias Sut = HomeViewModel
    
    func test_fetchData_ShouldReturnValidData() {
        // Given
        let (sut, fields) = makeSut()
        fields.fakeApi.fetchHomeDataImpl = { [unowned fields] completion in
            fields.serviceAction = { completion(.fixture()) }
            fields.callOrder.append("service called")
        }
        fields.queue.asyncImpl = { [unowned fields] completion in
            fields.queueAction = { completion() }
            fields.callOrder.append("queue called")
        }
        fields.delegateMock?.didFetchHomeDataImpl = { [unowned fields] in
            XCTAssertEqual($0, .fixture())
            fields.callOrder.append("delegate called")
        }
        
        // When
        sut.fetchData()
        
        // Then
        XCTAssertEqual(fields.callOrder, ["service called"])
        
        fields.serviceAction?()
        
        XCTAssertEqual(fields.callOrder, ["service called", "queue called"])
        
        fields.queueAction?()
        
        XCTAssertEqual(fields.callOrder, ["service called", "queue called", "delegate called"])
    }
    
    func test_fetchData_ShouldReturnNilData() {
        // Given
        let (sut, fields) = makeSut()
        fields.fakeApi.fetchHomeDataImpl = { [unowned fields] completion in
            fields.serviceAction = { completion(nil) }
            fields.callOrder.append("service called")
        }
        
        // When
        sut.fetchData()
        
        // Then
        XCTAssertEqual(fields.callOrder, ["service called"])
        
        fields.serviceAction?()
        
        XCTAssertEqual(fields.callOrder, ["service called"])
    }
    
    func test_Sut_ShouldNotKeepStrongReferenceToDelegate() {
        // Given
        let (sut, fields) = makeSut()
        
        // When
        fields.delegateMock = nil
        
        // Then
        XCTAssertNil(sut.delegate)
    }
}

extension HomeViewModelTests {
    class Fields {
        var callOrder = [String]()
        
        let fakeApi = FinanceServiceMock()
        var delegateMock: HomeViewModelDelegateMock? = .init()
        let queue = DispatchQueueMock()
        
        var serviceAction: (() -> Void)?
        var queueAction: (() -> Void)?
    }
    
    func makeSut() -> (sut: Sut, fields: Fields) {
        let fields = Fields()
        
        var sut = Sut(financeService: fields.fakeApi, queue: fields.queue)
        sut.delegate = fields.delegateMock
        
        XCTAssertNoMemoryLeak(fields.delegateMock)
        XCTAssertNoMemoryLeak(fields.fakeApi)
        XCTAssertNoMemoryLeak(fields.queue)
        
        return (sut, fields)
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

extension XCTestCase {
    public func XCTAssertNoMemoryLeak<T>(
        _ expression1: @autoclosure () -> T?,
        _ message: @autoclosure () -> String = "",
        file: StaticString = #filePath,
        line: UInt = #line
    ) where T : AnyObject {
        addTeardownBlock { [weak object = expression1()] in
            XCTAssertNil(object)
        }
    }
}
