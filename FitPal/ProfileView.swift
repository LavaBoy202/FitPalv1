//
//  ProfileView.swift
//  FitPal
//
//  Created by Lavan Nithi on 2024-10-24.
//

import SwiftUICore
import SwiftUI

struct ProfileView: View {
    @EnvironmentObject var appState: AppState
    @State private var isEditing = false

    var body: some View {
        VStack {
            if isEditing {
                ProfileEditView(profile: $appState.userProfile)
            } else {
                Text("Name: \(appState.userProfile.name)")
                Text("Email: \(appState.userProfile.email)")
                Text("Height: \(appState.userProfile.height) cm")
                Text("Current Weight: \(appState.userProfile.currentWeight) kg")
                Text("Goal Weight: \(appState.userProfile.goalWeight) kg")
                Text("Calorie Goal: \(appState.userProfile.calorieGoal) cal")
            }

            Button(action: {
                isEditing.toggle()
            }) {
                Text(isEditing ? "Save" : "Edit Profile")
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
        }
        .padding()
    }
}
