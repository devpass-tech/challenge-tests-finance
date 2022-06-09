//
//  TableViewCellExtensionsTests.swift
//  FinanceAppTests
//
//  Created by Isabella Bencardino on 07/06/2022.
//

import XCTest
@testable import FinanceApp

class TableViewCellExtensionsTests: XCTestCase {

    override func setUpWithError() throws {}

    override func tearDownWithError() throws {}

    func test_classIdentifier_tableViewCell_shouldReturnClassName() {
        let activityCell = ActivityCellView.classIdentifier()
        XCTAssertEqual(activityCell, "ActivityCellView")
        
        let tableViewCell = UITableViewCell.classIdentifier()
        XCTAssertEqual(tableViewCell, "UITableViewCell")
        
        let sampleTableViewCell = SampleTableViewCell.classIdentifier()
        XCTAssertEqual(sampleTableViewCell, "SampleTableViewCell")
    }
    
    private class SampleTableViewCell: UITableViewCell {
        
    }
}
