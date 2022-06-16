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
        var financeServiceCompletion: ((ActivityDetails?) -> Void)?
        var queueCompletion: (() -> Void)?
        defer {
            financeServiceCompletion = nil
            queueCompletion = nil
        }
        let (sut, fields) = makeSut()
        fields.financeService.fetchActivityDetailsImpl = { [unowned fields] in
            fields.callOrder.append("fetchActivityDetails called")
            financeServiceCompletion = $0
        }
        fields.queue.asyncImpl = { [unowned fields] in
            fields.callOrder.append("queue called")
            queueCompletion = $0
        }
        fields.delegate?.didFetchActivityDetailsImpl = { [unowned fields] activityDetails in
            fields.callOrder.append("didFetchActivityDetails called")
            XCTAssertEqual(activityDetails, .fixture())
        }
        
        sut.fetchData()
        
        XCTAssertEqual(fields.callOrder, ["fetchActivityDetails called"])
        
        financeServiceCompletion?(.fixture())
        
        XCTAssertEqual(fields.callOrder, ["fetchActivityDetails called", "queue called"])
        
        queueCompletion?()
        
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
    }
    
    func makeSut() -> (sut: Sut, fields: Fields) {
        let fields = Fields()
        
        var sut  = Sut(financeService: fields.financeService, queue: fields.queue)
        sut.delegate = fields.delegate
        
        addTeardownBlock { [weak delegate = fields.delegate, weak queue = fields.queue, weak financeService = fields.financeService] in
            XCTAssertNil(delegate)
            XCTAssertNil(queue)
            XCTAssertNil(financeService)
        }
        return (sut, fields)
    }
}
