//
//  AppState.swift
//  FitPal
//
//  Created by Lavan Nithi on 2024-10-24.
//

import SwiftUI

class AppState: ObservableObject {
    @Published var foods: [Food] = []
    @Published var dailyCalories: Int = 0
    @Published var userProfile: UserProfile = UserProfile(name: "John Doe", email: "john@example.com", height: 170.0, currentWeight: 70.0, goalWeight: 65.0, calorieGoal: 2000)
    
    // Functions to add calories or update user profile
    func addCalories(_ calories: Int) {
        dailyCalories += calories
    }
    
    func updateProfile(_ profile: UserProfile) {
        userProfile = profile
    }
}
