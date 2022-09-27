
import XCTest

@testable import FinanceApp

final class ActivityListViewTests: XCTestCase {
    
    private var delegateSpy = ActivityListViewDelegateSpy()
    private var sut = ActivityListView()
    
    func test_ActivityListView_ShouldBeDelegateNil_WhenTableViewDidSelectRow() {
        
        sut.delegate = nil
        
        XCTAssertNil(sut.delegate)
    }
    
    func test_ActivityListView_ShouldBeDelegateNotNil_WhenTableViewDidSelectRow() {
        
        sut.delegate = delegateSpy
        
        XCTAssertNotNil(sut.delegate)
    }
    
    func test_ActivityListView_ShouldBeCalled_WhenTableViewDidSelectRow() {
        
        let indexPath = IndexPath(row: 0, section: 0)
        
        sut.delegate = delegateSpy
        sut.tableView.delegate?.tableView?(.init(), didSelectRowAt: indexPath)
        
        XCTAssertTrue(delegateSpy.didSelectedCalled)
    }
    
    func test_ActivityListView_ShouldBeCalledOnceOnly_WhenTableViewDidSelectRow() {
        
        let indexPath = IndexPath(row: 0, section: 0)
        
        sut.delegate = delegateSpy
        sut.tableView.delegate?.tableView?(.init(), didSelectRowAt: indexPath)
        
        XCTAssertEqual(delegateSpy.didSelectedCount, 1)
    }
    
    func test_ActivityListView_ShouldBeCountRows_WhenTableViewNumberOfRowsBuild() {
        
        sut.delegate = delegateSpy
        let numberOfRows = sut.tableView.numberOfRows(inSection: 0)
        
        XCTAssertEqual(numberOfRows, 5)
    }
    
    func test_ActivityListView_ShouldBeActivityCellView_WhenTableViewCellForRowBuild() {
        
        let indexPath = IndexPath(row: 0, section: 0)
        
        sut.delegate = delegateSpy
        let tableViewCell = sut.tableView.cellForRow(at: indexPath)
        
        XCTAssertTrue(tableViewCell is ActivityCellView)
    }
    
    func test_ActivityListView_ShouldBeHeightRow_WhenTableViewCellForRowBuild() {
        
        let indexPath = IndexPath(row: 0, section: 0)
        
        sut.delegate = delegateSpy
        let tableViewCell = sut.tableView.cellForRow(at: indexPath)
        
        XCTAssertEqual(tableViewCell?.frame.height, CGFloat(82))
    }
}
