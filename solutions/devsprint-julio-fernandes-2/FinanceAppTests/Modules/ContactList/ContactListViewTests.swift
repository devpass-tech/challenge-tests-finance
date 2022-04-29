//
//  ContactListViewTests.swift
//  FinanceAppTests
//
//  Created by Julio Fernandes on 29/04/22.
//

import XCTest
import SnapshotTesting
@testable import FinanceApp

final class ContactListViewTests: XCTestCase {
    
    private let size: CGSize = .init(width: 320, height: 480)
    private let lightMode = UITraitCollection(userInterfaceStyle: .light)
    private let darkMode = UITraitCollection(userInterfaceStyle: .dark)
    
    private var sut: ContactListView?

    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = ContactListView()
    }

    override func tearDownWithError() throws {
        sut = nil
        try super.tearDownWithError()
    }
    
    func test_init() throws{
        let sut = try XCTUnwrap(sut)
        XCTAssertEqual(sut.subviews.count, 1)
        XCTAssertEqual(sut.tableView(sut.tableView, numberOfRowsInSection: 1), 10)
    }

    func test_initCoder() {
        let sut = ContactListView(coder: NSCoder())
        XCTAssertNil(sut)
    }
    
    func test_ActivityCellView_LightContent() throws {
       let sut = try XCTUnwrap(sut)
       sut.backgroundColor = .white
       assertSnapshot(matching: sut, as: .image(size: size, traits: lightMode))
   }
   
   func test_ActivityCellView_DarkContent() throws {
       let sut = try XCTUnwrap(sut)
       sut.backgroundColor = .black
       assertSnapshot(matching: sut, as: .image(size: size, traits: darkMode))
   }

}
