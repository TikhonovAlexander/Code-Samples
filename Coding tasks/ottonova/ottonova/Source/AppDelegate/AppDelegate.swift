//
//  AppDelegate.swift
//  ottonova
//
//  Created by atikhonov on 13/02/19
//  Copyright © 2019 atikhonov. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        configureApp()
        return true
    }
    
    func applicationDidEnterBackground(_ application: UIApplication) {
    }
    
    func applicationWillTerminate(_ application: UIApplication) {
    }
    
    fileprivate func configureApp() {
        configureAppearance()
        configureOtherThings()
    }
    
    fileprivate func configureAppearance() {}
    
    fileprivate func configureOtherThings() {
        
        // print root directory of app
        let documentsPath: String = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]
        print(documentsPath)
    }
}
