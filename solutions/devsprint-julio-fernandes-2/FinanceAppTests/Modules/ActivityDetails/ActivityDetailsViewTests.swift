//
//  ActivityDetailsViewTests.swift
//  FinanceAppTests
//
//  Created by Julio Fernandes on 29/04/22.
//

import XCTest
import SnapshotTesting
@testable import FinanceApp

final class ActivityDetailsViewTests: XCTestCase {
    
    private let size: CGSize = .init(width: 320, height: 480)
    private let lightMode = UITraitCollection(userInterfaceStyle: .light)
    private let darkMode = UITraitCollection(userInterfaceStyle: .dark)
    
    private var sut: ActivityDetailsView?

    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = ActivityDetailsView()
    }

    override func tearDownWithError() throws {
        sut = nil
        try super.tearDownWithError()
    }
    
    func test_init() {
        XCTAssertEqual(sut?.subviews.count, 2)
    }

    func test_initCoder() {
        let sut = ActivityDetailsView(coder: NSCoder())
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
