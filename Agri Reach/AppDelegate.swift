//
//  AppDelegate.swift
//  Agri Reach
//
//  Created by Kiran on 08/04/22.
//

import UIKit
import Localize_Swift

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    static var shared : AppDelegate = AppDelegate()


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        #if DEV
        print("DEV")
        
        #elseif Prod
        print("Prod")
                
        #else
        print("QA")

        #endif
        
        
        Localize.setCurrentLanguage("en")

        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

extension AppDelegate {
    func overrideApplicationThemeStyle() {
        if #available(iOS 13.0, *) {

            UIApplication.shared.keyWindow?.overrideUserInterfaceStyle = .light
        } else {
        }
    }
}
