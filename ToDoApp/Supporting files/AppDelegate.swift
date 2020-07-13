//
//  AppDelegate.swift
//  ToDoApp
//
//  Created by Boris Goncharov on 6/28/20.
//  Copyright © 2020 Boris Goncharov. All rights reserved.
//
import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        #if targetEnvironment(simulator)
        if let documentPath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
            print("Tasks File Directory: \(documentPath)")
        }
        #endif
        
        return true
    }
}
