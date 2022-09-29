
import Foundation

@testable import FinanceApp

final class ActivityListViewDelegateSpy: ActivityListViewDelegate {
    
    private(set) var didSelectedCalled: Bool = false
    private(set) var didSelectedCount: Int = 0
    
    func didSelectedActivity() {
        didSelectedCalled = true
        didSelectedCount += 1
    }
}
