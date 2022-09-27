
import XCTest

@testable import FinanceApp

class ActivityListViewTests: XCTestCase {

    // MARK: - Properties
    
    private var delegateSpy = ActivityListViewDelegateSpy()
    private var sut = ActivityListView()
    
    // MARK: - Methods
    
    func test_ActivityListView_givenDelegateWasCalled() {
        
        let indexPath = IndexPath(row: 0, section: 0)
        
        sut.delegate = delegateSpy
        sut.tableView.delegate?.tableView?(.init(), didSelectRowAt: indexPath)
        
        XCTAssertTrue(delegateSpy.didSelectedHasCalled)
    }
    
    func test_ActivityListView_givenDelegateWasCalledOnceOnly() {
        
        let indexPath = IndexPath(row: 0, section: 0)
        
        sut.delegate = delegateSpy
        sut.tableView.delegate?.tableView?(.init(), didSelectRowAt: indexPath)
        
        XCTAssertEqual(delegateSpy.didSelectedCount, 1)
    }
    
    func test_ActivityListView_givenNumberOfRows_shouldCountRows() {
        
        sut.delegate = delegateSpy
        let numberOfRows = sut.tableView.numberOfRows(inSection: 0)
        
        XCTAssertEqual(numberOfRows, 5)
    }
    
    func test_ActivityListView_givenCellForRow_shouldShowActivityCellView() {
        
        let indexPath = IndexPath(row: 0, section: 0)
        
        sut.delegate = delegateSpy
        let tableViewCell = sut.tableView.cellForRow(at: indexPath)
        
        XCTAssertTrue(tableViewCell is ActivityCellView)
    }
    
    func test_ActivityListView_givenHeightRow_shouldShowHeightRow() {
        
        let indexPath = IndexPath(row: 0, section: 0)
        
        sut.delegate = delegateSpy
        let tableViewCell = sut.tableView.cellForRow(at: indexPath)
        
        XCTAssertEqual(tableViewCell?.frame.height, CGFloat(82))
    }
}
