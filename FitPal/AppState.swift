//
//  AppState.swift
//  FitPal
//
//  Created by Lavan Nithi on 2024-10-24.
//

import SwiftUI

class AppState: ObservableObject {
    @Published var userProfile = UserProfile(
        name: "John Doe",
        email: "john@example.com",
        height: 170.0,
        currentWeight: 70.0,
        goalWeight: 65.0,
        calorieGoal: 2000,
        proteinGoal: 100
    )

    @Published var foodData = FoodData()  // Initialize food data here
    @Published var dailyCalories: Double = 1500  // Example calorie intake
    @Published var dailyProtein: Double = 75     // Example protein intake
}



