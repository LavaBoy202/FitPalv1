//
//  FitPalApp.swift
//  FitPal
//
//  Created by Lavan Nithi on 2024-10-23.
//

import SwiftUI

@main
struct FitPalApp: App {
    @StateObject private var appState = AppState()  // Centralized state object

       var body: some Scene {
           WindowGroup {
               MainView()
                   .environmentObject(appState)  // Pass the AppState to the entire app
           }
       }
   }
