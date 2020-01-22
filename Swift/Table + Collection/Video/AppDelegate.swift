//
//  AppDelegate.swift
//  Video
//
//  Created by atikhonov on 22.01.2020.
//  Copyright © 2020 atikhonov. All rights reserved.
//

import UIKit
import CoreData

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    lazy var  coreDataStack = CoreDataStack(modelName: "Video")
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        seedDataIfNeeded()
        
        guard let navController = window?.rootViewController as? UINavigationController,
            let viewController = navController.topViewController as? TableViewController else {
                return true
        }
        
        viewController.coreDataStack = coreDataStack
        
        return true
    }
    
    func applicationWillTerminate(_ application: UIApplication) {
        coreDataStack.saveContext()
    }
    
    private func seedDataIfNeeded() {
        let fetchRequest: NSFetchRequest<Video> = Video.fetchRequest()
        let count = try? coreDataStack.managedContext.count(for: fetchRequest)
        
        guard let teamCount = count,
            teamCount == 0 else {
                return
        }
        
        seedData()
    }
    
    private func seedData() {
        for _ in 1...6 {
            let video = Video(context: coreDataStack.managedContext)
            video.videoName = "image"
        }
        coreDataStack.saveContext()
    }
    
}

