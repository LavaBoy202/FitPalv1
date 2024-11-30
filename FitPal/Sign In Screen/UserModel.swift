//
//  UserModel.swift
//  FitPal
//
//  Created by Lavan Nithi on 2024-11-29.
//

struct UserModel {
    let uid: String
    let email: String
    let firstName: String
    let lastName: String
    let goalCalories: Int
    let goalWeight: Double
    let weight: Double
    let height: Double

    init(userData: [String: Any]) {
        self.uid = userData["uid"] as? String ?? ""
        self.email = userData["email"] as? String ?? ""
        self.firstName = userData["firstName"] as? String ?? ""
        self.lastName = userData["lastName"] as? String ?? ""
        self.goalCalories = userData["goalCalories"] as? Int ?? 0
        self.goalWeight = userData["goalWeight"] as? Double ?? 0.0
        self.weight = userData["weight"] as? Double ?? 0.0
        self.height = userData["height"] as? Double ?? 0.0
    }
}
