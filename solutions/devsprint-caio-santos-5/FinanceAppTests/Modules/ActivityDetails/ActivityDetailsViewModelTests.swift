import Foundation
@testable import FinanceApp
import XCTest

final class ActivityDetailsViewModelTests: XCTestCase {
    typealias Sut = ActivityDetailsViewModel
    
    func test_Sut_ShouldNotKeepStrongReferenceToDelegate() {
        let (sut, fields) = makeSut()
        
        fields.delegate = nil
        
        XCTAssertNil(sut.delegate)
    }
    
    func test_FetchData_WhenServiceSuccess_ShouldPassDataToDelegate_OnMainThread() {
        let (sut, fields) = makeSut()
        fields.financeService.fetchActivityDetailsImpl = { [unowned fields] completion in
            fields.callOrder.append("fetchActivityDetails called")
            fields.financeServiceCompletion = { completion(.fixture()) }
        }
        fields.queue.asyncImpl = { [unowned fields] in
            fields.callOrder.append("queue called")
            fields.queueCompletion = $0
        }
        fields.delegate?.didFetchActivityDetailsImpl = { [unowned fields] activityDetails in
            fields.callOrder.append("didFetchActivityDetails called")
            XCTAssertEqual(activityDetails, .fixture())
        }
        
        sut.fetchData()
        
        XCTAssertEqual(fields.callOrder, ["fetchActivityDetails called"])
        
        fields.financeServiceCompletion?()
        
        XCTAssertEqual(fields.callOrder, ["fetchActivityDetails called", "queue called"])
        
        fields.queueCompletion?()
        
        XCTAssertEqual(fields.callOrder, [
            "fetchActivityDetails called",
            "queue called",
            "didFetchActivityDetails called"
        ])
    }
    
    func test_FetchData_WhenServiceFail_ShouldDoNothing() {
        let (sut, fields) = makeSut()
        fields.financeService.fetchActivityDetailsImpl = { [unowned fields] completion in
            fields.callOrder.append("fetchActivityDetails called")
            completion(nil)
        }
        
        sut.fetchData()
        
        XCTAssertEqual(fields.callOrder, ["fetchActivityDetails called"])
    }
}

extension ActivityDetailsViewModelTests {
    final class Fields {
        var callOrder = [String]()
        
        let financeService = FinanceServiceMock()
        let queue = DispatchQueueMock()
        var delegate: ActivityDetailsViewModelDelegateMock? = .init()
        
        var financeServiceCompletion: (() -> Void)?
        var queueCompletion: (() -> Void)?
    }
    
    func makeSut() -> (sut: Sut, fields: Fields) {
        let fields = Fields()
        
        var sut  = Sut(financeService: fields.financeService, queue: fields.queue)
        sut.delegate = fields.delegate
        
        XCTAssertNoMemoryLeak(fields.delegate)
        XCTAssertNoMemoryLeak(fields.financeService)
        XCTAssertNoMemoryLeak(fields.queue)
        
        return (sut, fields)
    }
}
