//
//  AppDelegate.swift
//  Gymnastics
//
//  Created by Squall on 7/26/18.
//  Copyright © 2018 Squall. All rights reserved.
//

import UIKit
import CoreData

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var tabbarController:UITabBarController?
    
    var navGym:UINavigationController?
    var navCardio:UINavigationController?
    var navHistory:UINavigationController?
    var navReport:UINavigationController?
    
    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        window  = UIWindow(frame: UIScreen.main.bounds)
        let mainVC:GGymVC = GGymVC(nibName: GGymVC.typeName, bundle: Bundle.main)
        self.window?.rootViewController = mainVC
        window?.makeKeyAndVisible()
        
        createTabbarController()
        return true
    }

    func createTabbarController() {
        tabbarController = UITabBarController()
        tabbarController?.delegate = self
        //1st
        let gymVC:GGymVC = GGymVC(nibName: GGymVC.typeName, bundle: Bundle.main)
        let tabbarItemGym = UITabBarItem(title: "Gym", image: nil, selectedImage: nil)
        gymVC.tabBarItem = tabbarItemGym
        navGym = UINavigationController(rootViewController: gymVC)
        
        //2nd
        let cardioVC:GCardioVC = GCardioVC(nibName: GCardioVC.typeName, bundle: Bundle.main)
        let tabbarItemCardio = UITabBarItem(title: "Cardio", image: nil, selectedImage: nil)
        cardioVC.tabBarItem = tabbarItemCardio
        navCardio = UINavigationController(rootViewController: cardioVC)
        
        //3rd
        let historyVC:GHistoryVC = GHistoryVC(nibName: GHistoryVC.typeName, bundle: Bundle.main)
        let tabbarItemHistory = UITabBarItem(title: "History", image: nil, selectedImage: nil)
        historyVC.tabBarItem = tabbarItemHistory
        navHistory = UINavigationController(rootViewController: historyVC)
        
        //4th
        let reportVC:GReportVC = GReportVC(nibName: GReportVC.typeName, bundle: Bundle.main)
        let tabbarItemReport = UITabBarItem(title: "Report", image: nil, selectedImage: nil)
        reportVC.tabBarItem = tabbarItemReport
        navReport = UINavigationController(rootViewController: reportVC)
        
        tabbarController?.viewControllers = [navGym, navCardio, navHistory, navReport] as? [UIViewController]
        tabbarController?.customizableViewControllers = [navGym, navCardio, navHistory, navReport] as? [UIViewController]
    }
    
    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
        // Saves changes in the application's managed object context before the application terminates.
        self.saveContext()
    }

    // MARK: - Core Data stack

    lazy var persistentContainer: NSPersistentContainer = {
        /*
         The persistent container for the application. This implementation
         creates and returns a container, having loaded the store for the
         application to it. This property is optional since there are legitimate
         error conditions that could cause the creation of the store to fail.
        */
        let container = NSPersistentContainer(name: "Gymnastics")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                 
                /*
                 Typical reasons for an error here include:
                 * The parent directory does not exist, cannot be created, or disallows writing.
                 * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                 * The device is out of space.
                 * The store could not be migrated to the current model version.
                 Check the error message to determine what the actual problem was.
                 */
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()

    // MARK: - Core Data Saving support

    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
        
}

extension AppDelegate:UITabBarControllerDelegate{
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        return true
    }
}


