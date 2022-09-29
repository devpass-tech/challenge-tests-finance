import XCTest
@testable import FinanceApp

class TabBarControllerTests: XCTestCase {
    
    private let sut = TabBarController()
    
    func test_viewWillAppear_numberOfViewControllersOnTabBarShouldBeTwo(){
        sut.viewWillAppear(false)
        
        XCTAssertEqual(sut.viewControllers?.count, 2)
        XCTAssertEqual(sut.tabBar.items?.count, 2)
    }
    
    func test_firstViewControllerType_shouldBeHomeViewController(){
        sut.viewWillAppear(false)
        
        let expectedResult = sut.viewControllers?[0].children.contains { $0 is HomeViewController }
        
        XCTAssertTrue(expectedResult == true)
    }
    
    func test_secondViewControllerType_shouldBeTransfersViewController(){
        sut.viewWillAppear(false)
        
        let expectedResult = sut.viewControllers?[1].children.contains { $0 is TransfersViewController }
        
        XCTAssertTrue(expectedResult == true)
    }
    
}
