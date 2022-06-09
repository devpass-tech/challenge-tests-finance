//
//  UITableViewCellTests.swift
//  FinanceAppTests
//
//  Created by Natália Sapucaia on 08/06/22.
//

import XCTest
@testable import FinanceApp

class UITableViewCellExtensionTests: XCTestCase {

    private class CustomTableViewCell: UITableViewCell {

    }

    func test_ClassIdentifier_Activity_ShouldReturnActivityCellView() {
        //GIVEN
        let activity = ActivityCellView.classIdentifier()

        //THEN
        XCTAssertEqual(activity, "ActivityCellView")
    }

    func test_ClassIdentifier_Contact_ShouldReturnContactCellView() {
        //GIVEN
        let contact = ContactCellView.classIdentifier()

        //THEN
        XCTAssert(contact == "ContactCellView")
    }

    func test_ClassIdentifier_CustomCellView_ShouldReturnClassName() {
        //GIVEN
        let customClassName = CustomTableViewCell.classIdentifier()

        //THEN
        XCTAssertEqual(customClassName, "CustomTableViewCell")
    }

}
