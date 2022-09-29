
import XCTest

@testable import FinanceApp

final class ActivityListViewTests: XCTestCase {
    
    private var delegateSpy = ActivityListViewDelegateSpy()
    
    private var sut: ActivityListView {
        let activityListView = ActivityListView()
        activityListView.delegate = delegateSpy
        return activityListView
    }
    
    func test_ActivityListView_givenDelegate_shouldReturnDelegateNotNil() {
        
        XCTAssertNotNil(sut.delegate)
    }
    
    func test_ActivityListView_whenTriggerDidSelectRow_shouldDelegateCalled() {
        
        let indexPath = IndexPath(row: 0, section: 0)
        
        sut.tableView(fixture(), didSelectRowAt: indexPath)
        
        XCTAssertTrue(delegateSpy.didSelectedCalled)
    }
    
    func test_ActivityListView_whenTriggerDidSelectRow_shouldDelegateCalledOnceOnly() {
        
        let indexPath = IndexPath(row: 0, section: 0)
        
        sut.tableView(fixture(), didSelectRowAt: indexPath)
        
        XCTAssertEqual(delegateSpy.didSelectedCount, 1)
    }
    
    func test_ActivityListView_whenTriggerNumberOfRowInSection_shouldReturnCountCorrectly() {
        
        let numberOfRows = sut.tableView(fixture(), numberOfRowsInSection: 0)
        
        XCTAssertEqual(numberOfRows, 5)
    }
    
    func test_ActivityListView_givenRegisterTableViewCell_shouldBeActivityCellView() {
        
        let indexPath = IndexPath(row: 0, section: 0)
        
        let tableViewCell = sut.tableView(fixture(), cellForRowAt: indexPath)
        
        XCTAssertTrue(tableViewCell is ActivityCellView)
    }
}

private extension ActivityListViewTests {
    
    func fixture() -> UITableView {
        let tableView = UITableView()
        tableView.register(ActivityCellView.self, forCellReuseIdentifier: "ActivityCellIdentifier")
        return tableView
    }
}
