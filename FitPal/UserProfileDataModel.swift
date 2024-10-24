//
//  UserProfileDataModel.swift
//  FitPal
//
//  Created by Lavan Nithi on 2024-10-23.
//

struct UserProfile: Codable {
    var name: String
    var email: String
    var height: Double
    var currentWeight: Double
    var goalWeight: Double
    var calorieGoal: Int
}

