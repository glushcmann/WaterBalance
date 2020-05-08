//
//  AppDelegate.swift
//  WaterBalance
//
//  Created by Никита on 06.05.2020.
//  Copyright © 2020 Nikita Glushchenko. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    let layout = UICollectionViewFlowLayout()


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = UINavigationController(rootViewController: MainVC(collectionViewLayout: layout))
        window?.makeKeyAndVisible()
        
        return true
    }

}

