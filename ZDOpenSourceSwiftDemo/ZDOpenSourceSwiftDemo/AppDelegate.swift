//
//  AppDelegate.swift
//  ZDOpenSourceSwiftDemo
//
//  Created by Zero.D.Saber on 2017/8/4.
//  Copyright © 2017年 Zero.D.Saber. All rights reserved.
//

import UIKit
import GDPerformanceView_Swift
import Buglife
import Peek
import Watchdog

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    var watchDog: Watchdog!
    
    private func showPerformanceMonitor() {
        // performanceMonitor
        GDPerformanceMonitor.sharedInstance.startMonitoring { (label) in
            label?.backgroundColor = .red
            label?.textColor = .yellow
            label?.layer.borderColor = UIColor.brown.cgColor
        }
    }

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        watchDog = Watchdog(threshold: 0.4, strictMode: true)
        
        showPerformanceMonitor()
        
        // bugMonitor
        Buglife.shared().start(withEmail: "fuxianchao2009@163.com")
        
        //self.window?.swizzleShake()
        
        window?.peek.enabled = true
        
        return true
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
    }
    
    override func becomeFirstResponder() -> Bool {
        return true
    }
    
    override func motionBegan(_ motion: UIEventSubtype, with event: UIEvent?) {
        if motion == .motionShake {
            
        }
        
        window?.peek.handleShake(motion)
    }
}

