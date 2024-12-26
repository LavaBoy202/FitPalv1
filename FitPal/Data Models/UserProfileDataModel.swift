//
//  UserProfileDataModel.swift
//  FitPal
//
//  Created by Lavan Nithi on 2024-10-23.
//

struct UserProfile: Codable {
    var name: String = "Unknown"
    var email: String = "unknown@example.com"
    var height: Double = 0.0
    var currentWeight: Double = 0.0
    var goalWeight: Double = 0.0
    var calorieGoal: Double = 2000.0
    var proteinGoal: Double = 100.0
    var uid: String = ""
}

