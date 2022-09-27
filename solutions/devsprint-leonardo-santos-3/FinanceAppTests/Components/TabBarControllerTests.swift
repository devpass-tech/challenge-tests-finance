import XCTest
@testable import FinanceApp

class TabBarControllerTests: XCTestCase {
    
    private let sut = TabBarController()
    
    func test_numberOfViewControllersOnTabBar_shouldBeTwo(){
        sut.viewWillAppear(false)
        
        XCTAssertEqual(sut.viewControllers?.count, 2)
        XCTAssertEqual(sut.tabBar.items?.count, 2)
    }
    
    func test_firstViewControllerType_shouldBeHomeViewController(){
        sut.viewWillAppear(false)
        
        sut.viewControllers?[0].children.forEach({ (element) in
            XCTAssertTrue(type(of: element) == HomeViewController.self, "Element type is: \(String(describing: type(of: element))) " )
        })
    }
    
    func test_secondViewControllerType_shouldBeTransfersViewController(){
        sut.viewWillAppear(false)
        
        sut.viewControllers?[1].children.forEach({ (element) in
            XCTAssertTrue(type(of: element) == TransfersViewController.self, "Element type is: \(String(describing: type(of: element))) " )
        })
    }
    
}
