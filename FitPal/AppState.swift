//
//  AppState.swift
//  FitPal
//
//  Created by Lavan Nithi on 2024-10-24.
//

import SwiftUI

class AppState: ObservableObject {
    @Published var userProfile = UserModel()
    @Published var foodData = FoodData()  // Initialize food data here
    @Published var dailyCalories: Double = 1500  // Example calorie intake
    @Published var dailyProtein: Double = 75     // Example protein intake
    @Published var streakDays: Int = 5
    @Published var isAuthenticated: Bool = false
    @Published var isOnBoarding: Bool = false
}



