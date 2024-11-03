//
//  ProfileeditView.swift
//  FitPal
//
//  Created by Lavan Nithi on 2024-10-24.
//

import SwiftUICore
import SwiftUI

struct ProfileEditView: View {
    @Binding var profile: UserProfile  // Bind to the profile in AppState

    var body: some View {
        Form {
            TextField("Name", text: $profile.name)
            TextField("Email", text: $profile.email)
            TextField("Height", value: $profile.height, formatter: NumberFormatter())
            TextField("Current Weight", value: $profile.currentWeight, formatter: NumberFormatter())
            TextField("Goal Weight", value: $profile.goalWeight, formatter: NumberFormatter())
            TextField("Calorie Goal", value: $profile.calorieGoal, formatter: NumberFormatter())
        }
    }
}
