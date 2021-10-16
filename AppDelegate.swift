//
//  AppDelegate.swift
//  CodingChallenge
//
//  Created by kanagasabapathy on 10/10/21.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    internal var window: UIWindow?



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.backgroundColor = UIColor.white
        
        let loginModel = LoginViewModel()
        let loginViewController = LoginViewController(viewModel: loginModel)
        
        
        let navigationViewController = UINavigationController(rootViewController: loginViewController)

        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = .systemYellow
        appearance.largeTitleTextAttributes = [
            NSAttributedString.Key.font: UIFont.italicSystemFont(ofSize: 30)
        ]
        appearance.titleTextAttributes = [
            NSAttributedString.Key.font: UIFont.italicSystemFont(ofSize: 15)
        ]

        navigationViewController.navigationBar.scrollEdgeAppearance = appearance
        navigationViewController.navigationBar.compactAppearance = appearance
        navigationViewController.navigationBar.standardAppearance = appearance
        navigationViewController.viewControllers = [loginViewController]
        
        window?.rootViewController = navigationViewController
        window?.makeKeyAndVisible()
        return true
    }
}

