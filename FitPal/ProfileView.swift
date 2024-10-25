//
//  ProfileView.swift
//  FitPal
//
//  Created by Lavan Nithi on 2024-10-24.
//

import SwiftUICore
import SwiftUI

import SwiftUI

struct ProfileView: View {
    @EnvironmentObject var appState: AppState  // Accessing the user's profile from a shared state
    @State private var isEditing = false
    
    var body: some View {
        VStack {
            if isEditing {
                            ProfileEditView(profile: $appState.userProfile)
                        }
            else{
                HStack {
                    VStack(alignment: .leading) {
                        Text(appState.userProfile.email)
                            .font(.subheadline)
                            .foregroundColor(.white)
                        Text(appState.userProfile.name)
                            .font(.largeTitle)
                            .foregroundColor(.white)
                            .bold()
                    }
                    Spacer()
                    Image("profile_placeholder")  // Replace with actual image or binding
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 80, height: 80)
                        .clipShape(Circle())
                        .overlay(Circle().stroke(Color.white, lineWidth: 2))
                }
                .padding()
                .background(Color.blue.opacity(0.9))  // Dark blue background
                .cornerRadius(10)
                .padding()
                List {
                    ProfileItemRow(iconName: "ruler", title: "Height", value: "\(appState.userProfile.height) cm")
                    ProfileItemRow(iconName: "scalemass", title: "Current Weight", value: "\(appState.userProfile.currentWeight) kg")
                    ProfileItemRow(iconName: "target", title: "Goal Weight", value: "\(appState.userProfile.goalWeight) kg")
                    ProfileItemRow(iconName: "flame", title: "Daily Calorie Goal", value: "\(appState.userProfile.calorieGoal) cal")
                }
                .listStyle(InsetGroupedListStyle())
                
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
    }
}
