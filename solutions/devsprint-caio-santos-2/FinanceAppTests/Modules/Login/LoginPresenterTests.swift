//
//  LoginPresenterTests.swift
//  FinanceAppTests
//
//  Created by Caio Santos on 24/03/22.
//

import XCTest
@testable import FinanceApp

class LoginPresenterTests: XCTestCase {

    private var sut: LoginPresenter?
    let routerSpy = LoginRouterProtocolSpy()
    let viewContollerSpy = LoginPresenterOutputProtocolSpy()
    let interactor = LoginInteractor(network: NetworkClient())
    
    override func setUpWithError() throws {
        sut = LoginPresenter(router: routerSpy, interactor: interactor)
        sut?.viewController = viewContollerSpy
        interactor.output = sut
    }

    override func tearDownWithError() throws {
        sut = nil
    }
    
    func test_Authenticate_WithInvalidValues_ShouldCallAuthenticationFailed() throws {
        let sut = try XCTUnwrap(sut)

        sut.authenticate(email: "", password: "")
        XCTAssertTrue(viewContollerSpy.authenticationFailedCalled)
    }
    
    func test_Authenticate_WithInvalidEmail_ShouldCallAuthenticationFailed() throws {
        let sut = try XCTUnwrap(sut)

        sut.authenticate(email: "", password: "1111")
        XCTAssertTrue(viewContollerSpy.authenticationFailedCalled)
    }
    
    func test_Authenticate_WithInvalidPassword_ShouldCallAuthenticationFailed() throws {
        let sut = try XCTUnwrap(sut)

        sut.authenticate(email: "teste@teste.com", password: "")
        XCTAssertTrue(viewContollerSpy.authenticationFailedCalled)
    }
    
    func test_Authenticate_WithValidValues_ShouldShowHome() throws {
        let sut = try XCTUnwrap(sut)

        sut.authenticate(email: "teste@teste.com", password: "1111")
        XCTAssertTrue(self.routerSpy.showHomeViewCalled)
    }
    
    func test_Authenticate_WithInvalidUser_ShouldCallAuthenticationFailed() throws {
        let sut = try XCTUnwrap(sut)

        sut.authenticate(email: "aaaa@teste.com", password: "1111")
        XCTAssertTrue(self.viewContollerSpy.authenticationFailedCalled)
    }

    func test_createAccount_ShouldShowCreateAccountView() throws {
        let sut = try XCTUnwrap(sut)

        sut.showCreateAccountView()
        XCTAssertTrue(self.routerSpy.showCreateAccountViewCalled)
    }
}

class LoginRouterProtocolSpy: LoginRouterProtocol {
    var showCreateAccountViewCalled = false
    var showHomeViewCalled = false

    func showCreateAccountView() {
        showCreateAccountViewCalled = true
    }
    
    func showHomeView() {
        showHomeViewCalled = true
    }
}

class LoginPresenterOutputProtocolSpy: LoginPresenterOutputProtocol {
    var authenticationFailedCalled = false
    
    func authenticationFailed(message: String) {
        authenticationFailedCalled = true
    }
}
