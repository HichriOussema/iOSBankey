//
//  AppDelegate.swift
//  Bankey
//
//  Created by oussema Hichri on 25/04/2024.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

  var window:UIWindow?
  
  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    window = UIWindow(frame: UIScreen.main.bounds)
    window?.makeKeyAndVisible()
    window?.backgroundColor = .systemBackground
    window?.rootViewController = LoginViewController()
    
    return true
  }
}

