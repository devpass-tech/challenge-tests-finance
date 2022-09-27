
import Foundation

@testable import FinanceApp

final class ActivityListViewDelegateSpy: ActivityListViewDelegate {
    
    private(set) var didSelectedHasCalled: Bool = false
    private(set) var didSelectedCount: Int = 0
    
    func didSelectedActivity() {
        didSelectedHasCalled = true
        didSelectedCount += 1
    }
}
