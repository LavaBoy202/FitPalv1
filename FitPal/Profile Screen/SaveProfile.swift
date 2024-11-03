//
//  SaveProfile.swift
//  FitPal
//
//  Created by Lavan Nithi on 2024-10-24.
//

import Foundation

func saveProfile(profile: UserProfile) {
    if let encoded = try? JSONEncoder().encode(profile) {
        UserDefaults.standard.set(encoded, forKey: "UserProfile")
    }
}

func loadProfile() -> UserProfile? {
    if let savedProfile = UserDefaults.standard.object(forKey: "UserProfile") as? Data {
        if let decodedProfile = try? JSONDecoder().decode(UserProfile.self, from: savedProfile) {
            return decodedProfile
        }
    }
    return nil
}
