//
//  TransfersViewTests.swift
//  FinanceAppTests
//
//  Created by Julio Fernandes on 29/04/22.
//

import XCTest
import SnapshotTesting
@testable import FinanceApp

final class TransfersViewTests: XCTestCase {
    
    private let size: CGSize = .init(width: 320, height: 480)
    private let lightMode = UITraitCollection(userInterfaceStyle: .light)
    private let darkMode = UITraitCollection(userInterfaceStyle: .dark)
    
    private var sut: TransfersView?

    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = TransfersView()
    }

    override func tearDownWithError() throws {
        sut = nil
        try super.tearDownWithError()
    }
    
    func test_init() throws{
        let sut = try XCTUnwrap(sut)
        XCTAssertEqual(sut.subviews.count, 2)
    }

    func test_initCoder() {
        let sut = TransfersView(coder: NSCoder())
        XCTAssertNil(sut)
    }
    
    func test_chooseContact() {
        let delegate = TransferViewDelegateSpy()
        sut?.delegate = delegate
        
        sut?.chooseContact()
        XCTAssertTrue(delegate.didPressChooseContactButtonCalled)
    }
    
    func test_transfer() {
        let delegate = TransferViewDelegateSpy()
        sut?.delegate = delegate
        
        sut?.transfer()
        XCTAssertTrue(delegate.didPressTransferButtonCalled)
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

final class TransferViewDelegateSpy: TransferViewDelegate {
    
    private(set) var didPressChooseContactButtonCalled = false
    func didPressChooseContactButton() {
        didPressChooseContactButtonCalled = true
    }
    
    private(set) var didPressTransferButtonCalled = false
    func didPressTransferButton() {
        didPressTransferButtonCalled = true
    }
    
}
