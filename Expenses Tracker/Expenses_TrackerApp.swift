//
//  Expense_TrackerApp.swift
//  Expense_Tracker
//
//  Created by Viraj Fernando on 2023-09-12.
//

import SwiftUI
import Firebase
@main
struct Expense_TrackerApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
   
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()
      print("configurd firebase")
    return true
  }
}


