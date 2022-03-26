//
//  LoginViewControllerTests.swift
//  FinanceAppTests
//
//  Created by Caio Santos on 25/03/22.
//

import XCTest
@testable import FinanceApp

class LoginViewControllerTests: XCTestCase {

    private var sut: LoginViewController?
    let presenterSpy = LoginPresenterInputSpy()
    
    override func setUpWithError() throws {
        sut = LoginViewController(presenter: presenterSpy)
    }

    override func tearDownWithError() throws {
        sut = nil
    }
    
    func test_CreateAccount_ShouldShowCreateAccountView() throws {
        let sut = try XCTUnwrap(sut)
        sut.viewDidLoad()
        
        executeAsyncBlock {
            self.perform(event: .touchUpInside,
                         from: sut.createAccountButton,
                         target: sut,
                         args: nil)

        }

        XCTAssertTrue(presenterSpy.showCreateAccountViewCalled)
    }
    
    func test_Login_ShouldCallAuthenticateMethod() throws {
        let sut = try XCTUnwrap(sut)
        sut.viewDidLoad()
        
        executeAsyncBlock {
            self.perform(event: .touchUpInside,
                         from: sut.loginButton,
                         target: sut,
                         args: nil)

        }

        XCTAssertTrue(presenterSpy.authenticateCalled)
    }
    
    func test_authenticationFailed_ShouldShowWarningMessage() throws {
        let sut = try XCTUnwrap(sut)
        sut.viewDidLoad()

        XCTAssertTrue(sut.feedbackLabel.isHidden)
        XCTAssertNil(sut.feedbackLabel.text)

        sut.authenticationFailed(message: "TESTE")

        XCTAssertFalse(sut.feedbackLabel.isHidden)
        XCTAssertEqual(sut.feedbackLabel.text, "TESTE")
    }
}

class LoginPresenterInputSpy: LoginPresenterInputProtocol {
    var viewDidAppearCalled = false
    var authenticateCalled = false
    var showCreateAccountViewCalled = false
    
    func viewDidAppear() {
        viewDidAppearCalled = true
    }
    
    func authenticate(email: String, password: String) {
        authenticateCalled = true
    }
    
    func showCreateAccountView() {
        showCreateAccountViewCalled = true
    }
}

extension XCTestCase {
    /// Performs a given event from a UIControl into a parent view through Selector
    /// - Parameters:
    ///   - event: The event to be performed (.touchUpInside, .longPress...)
    ///   - button: The button or control executing the action
    ///   - target: The target of the action, who implements the #selector
    ///   - args: The argument of the call, usually the same as the control perfomer
    public func perform(event: UIControl.Event, from button: UIControl, target: AnyObject, args: Any?) {
        let action = button.actions(forTarget: target, forControlEvent: event)?.first ?? ""
        target.performSelector(onMainThread: Selector(action), with: args, waitUntilDone: true)
    }
    
    /// Performs an action for a given UIBarButtonItem
    /// - Parameters:
    ///   - barButtonItem: The UIBarButtonItem that will perform the action
    public func perform(actionFor barButtonItem: UIBarButtonItem) {
        _ = barButtonItem.target?.perform(barButtonItem.action)
    }
 
    /// Finds and performs given UIGestureRecognizer.Type on the given view
    /// - Parameters:
    ///   - type: The type of the gesture (UITapGestureRecoginizer, UILongPressGestureRecognizer...)
    ///   - view: The view which performs the action
    ///   - target: The target of the action, who implements the #selector
    public func performGestureRecognizer<T>(type: T.Type, on view: UIView, target: AnyObject) {
        let gesture = view.gestureRecognizers?.first { $0 is T }

        let targetAction = (gesture?.value(forKey: "_targets") as? [NSObject])?.first
        let selectorString = String(describing: targetAction)
            .components(separatedBy: ", ")
            .first?
            .replacingOccurrences(of: "(action=", with: "")
            .replacingOccurrences(of: "Optional(", with: "") ?? ""

        target.perform(.init(stringLiteral: selectorString))
    }
}
