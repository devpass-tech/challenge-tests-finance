//
//  UserProfileHeaderViewSnapshotTest.swift
//  FinanceAppTests
//
//  Created by Bruno Silva on 18/05/22.
//

import XCTest
import SnapshotTesting
@testable import FinanceApp

final class UserProfileHeaderViewSnapshotTest: XCTestCase {
    
    // MARK: - Private Properties
    private let screenSize: CGSize = CGSize(width: 400, height: 400)
    private let isRecording: Bool = false
    private var sut: UserProfileHeaderView!
    
    // MARK: - Life Cycle
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = UserProfileHeaderView()
    }
    
    override func tearDownWithError() throws {
        sut = nil
    }
    
    // MARK: - Tests Must return all complete information
    func test_testingUserProfileHeaderView_ShouldReturnAllCompleteInformations() {
        
        // Given
        let configuration = UserProfileHeaderConfiguration(imageView: UIImage(named: "avatar-placeholder"),
                                                            name: "Bruno Test",
                                                            agency: "Agency: 1234",
                                                            account: "Account: 12345678",
                                                            bank: "Banco Itau")
        // When
        sut.setup(with: configuration)
        
        // Then
        assertSnapshot(matching: sut,
                       as: .image(size: screenSize),
                       record: isRecording)
    }
    
    func test_testingUserProfileHeaderView_ShouldReturnWithoutImagem() {
        
        // Given
        let configuration = UserProfileHeaderConfiguration(imageView: nil,
                                                           name: "Noctis",
                                                           agency: "1234",
                                                           account: "123455678",
                                                           bank: "Nubank")
        // When
        sut.setup(with: configuration)
        
        // Then
        assertSnapshot(matching: sut,
                       as: .image(size: screenSize),
                       record: isRecording)
    }
}
