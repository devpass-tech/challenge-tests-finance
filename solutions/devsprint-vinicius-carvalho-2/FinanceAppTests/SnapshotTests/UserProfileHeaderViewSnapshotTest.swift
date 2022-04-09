//
//  UserProfileHeaderViewSnapshotTest.swift
//  FinanceAppTests
//
//  Created by Lucas Pinto on 09/04/22.
//

import XCTest
import SnapshotTesting

@testable import FinanceApp

class UserProfileHeaderViewSnapshotTest: XCTestCase {
    
    private let record: Bool = false
    private let size: CGSize = CGSize(width: 414, height: 300)
    
    func test_UserProfileHeaderView() {
        let sut: UserProfileHeaderView = UserProfileHeaderView()
        
        assertSnapshot(matching: sut, as: .image(size: size), record: record)
    }
}
