//
//  AppDelegate.swift
//  ReactiveWeatherApp
//
//  Created by Luka Muše on 11.05.2022..
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
      

        let viewController = WeatherViewController()
        let navigationController = UINavigationController(rootViewController: viewController)
        
        self.window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
        
        return true
    }

}

