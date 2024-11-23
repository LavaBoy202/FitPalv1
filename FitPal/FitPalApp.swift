//
//  FitPalApp.swift
//  FitPal
//
//  Created by Lavan Nithi on 2024-10-23.
//

import SwiftUI
import FirebaseCore


class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()

    return true
  }
}

struct ContentView: View {
    var body: some View {
        TabView {
            SignUpView()
                .tabItem {
                    Label("Sign Up", systemImage: "person.badge.plus")
                }
            
            SignInView()
                .tabItem {
                    Label("Sign In", systemImage: "person.fill")
                }
        }
    }
}

@main
struct FitPalApp: App {
    @StateObject private var appState = AppState()  // Centralized state object
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate

       var body: some Scene {
           WindowGroup {
                       ContentView()
                }
       }
   }
