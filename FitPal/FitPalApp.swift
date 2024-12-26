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
    @EnvironmentObject var appState: AppState
    var body: some View {
        if appState.isOnBoarding {
            OnboardingFlow(appState: appState, onComplete: {
                appState.isOnBoarding = false
                
                Task {
                    if let user = await fetchUser(uid: appState.userProfile.uid) {
                        
                        print("User fetched: \(user)")
                    } else {
                        print("User not found or an error occurred")
                    }
                }
                appState.isAuthenticated = true
            })
        }
        else if appState.isAuthenticated {
            MainView()
                .environmentObject(appState)
        }
        else{
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
}

@main
struct FitPalApp: App {
    @StateObject private var appState = AppState()
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
       var body: some Scene {
           WindowGroup {
                   ContentView()
                   .environmentObject(appState)
                       
            }
       }
   }
