@testable import FinanceApp
import XCTest

final class ActivityDetailsViewModelDelegateMock: ActivityDetailsViewModelDelegate {
    var didFetchActivityDetailsImpl: (_ data: ActivityDetails) -> Void = { _ in
        XCTFail("didFetchActivityDetailsImpl not implemented")
    }
    
    func didFetchActivityDetails(_ data: ActivityDetails) {
        didFetchActivityDetailsImpl(data)
    }
}
