//
//  AppDelegate.swift
//  FinanceApp
//
//  Created by Rodrigo Borges on 30/12/21.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let window = UIWindow(frame: UIScreen.main.bounds)
        window.backgroundColor = .white
        window.makeKeyAndVisible()
        window.rootViewController = UINavigationController(rootViewController: TabBarController())
        self.window = window
        
        return true
    }
    
}
