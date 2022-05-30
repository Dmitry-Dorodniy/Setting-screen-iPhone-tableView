//
//  AppDelegate.swift
//  IOS6=HW13-DmitryDorodniy
//
//  Created by Dmitry Dorodniy on 30.05.2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        setWindow()

        return true
    }

    func setWindow() {

            window = UIWindow(frame: UIScreen.main.bounds)
            window?.rootViewController = TableViewController()
            window?.makeKeyAndVisible()
        }
    }



