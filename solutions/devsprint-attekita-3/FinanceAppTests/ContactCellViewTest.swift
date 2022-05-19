//
//  ContactCellViewTest.swift
//  FinanceAppTests
//
//  Created by Tatiana Rico on 17/05/22.
//

import XCTest
import SnapshotTesting
@testable import FinanceApp

class ContactCellViewTest: XCTestCase {
    private var size = CGSize(width: 414, height: 149)
    private var sut: ContactCellView!
    private var isRecord: Bool = false

    override func setUpWithError() throws {
        try super .setUpWithError()
        sut = ContactCellView()
    }

    override func tearDownWithError() throws {
       try super.tearDownWithError()
       sut = nil
    }

    func test_ContactCellView_allInformation() {
        let configuration = ContactCellViewConfiguration(contactNameLabel: "Contact Name",
                                                         contactPhoneLabel: "11 976663888",
                                                         imageView: UIImage(named: "avatar-placeholder"))
        sut.setup(configure: configuration)
        
        assertSnapshot(matching: sut, as: .image(size: size), record: isRecord)
    }
    
    func test_ContactCellView_labelIsEmpty() {
        let configuration = ContactCellViewConfiguration(contactNameLabel: "",
                                                         contactPhoneLabel: "11 976663888",
                                                         imageView: UIImage(named: "avatar-placeholder"))
        sut.setup(configure: configuration)
        
        assertSnapshot(matching: sut, as: .image(size: size), record: isRecord)
    }
    
    func test_ContactCellView_imageIsEmpty() {
        let configuration = ContactCellViewConfiguration(contactNameLabel: "Name",
                                                         contactPhoneLabel: "11 976663888",
                                                         imageView: nil)
        sut.setup(configure: configuration)
        
        assertSnapshot(matching: sut, as: .image(size: size), record: isRecord)
    }
}
