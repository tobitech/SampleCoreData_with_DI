//
//  AppDelegate.swift
//  CoreDataGenerateObjectsManual
//
//  Created by Oluwatobi Omotayo on 23/12/2018.
//  Copyright © 2018 Hollaport. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow()
        window?.rootViewController = UINavigationController(rootViewController: FriendsViewController())
        window?.makeKeyAndVisible()
        
        return true
    }


}

