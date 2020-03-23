//
//  AppDelegate.swift
//  HTGKCordovaKit
//
//  Created by YUJINHAI2015 on 05/07/2019.
//  Copyright (c) 2019 YUJINHAI2015. All rights reserved.
//

import UIKit
import HTGKCordovaKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        window = UIWindow.init(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        let tab = UITabBarController.init()
        //
        let viewC1 = ViewController()
        viewC1.tabBarItem.title = "view1"
        let navi = UINavigationController.init(rootViewController: viewC1)
        tab.addChild(navi)
        //
        
        let viewC2 = SecondViewController()
        viewC2.tabBarItem.title = "view2"
        tab.addChild(viewC2)
        window?.rootViewController = tab
        return true
    }

}

