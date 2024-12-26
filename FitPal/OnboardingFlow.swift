//
//  OnboardingFlow.swift
//  FitPal
//
//  Created by Lavan Nithi on 2024-12-26.
//


import SwiftUI
import Firebase
import FirebaseFirestore
import FirebaseAuth

struct OnboardingFlow: View {
    @ObservedObject var appState: AppState
    var onComplete: () -> Void
    @State private var height: String = ""
    @State private var weight: String = ""
    @State private var goalWeight: String = ""
    @State private var goalCalories: String = ""
    @State private var currentStep: Int = 0

    var body: some View {
        VStack {
            if currentStep == 0 {
                HeightScreen(height: $height, onNext: { currentStep += 1 })
            } else if currentStep == 1 {
                WeightScreen(weight: $weight, onNext: { currentStep += 1 })
            } else if currentStep == 2 {
                GoalWeightScreen(goalWeight: $goalWeight, onNext: { currentStep += 1 })
            } else if currentStep == 3 {
                GoalCaloriesScreen(goalCalories: $goalCalories, onNext: { currentStep += 1 })
            } else {
                FinalScreen(onFinish: {
                    saveData()
                    onComplete()
                })
            }
        }
    }

    func saveData() {
        // Save all data to your preferred storage method here (e.g., UserDefaults, CoreData, or an API)
        
        let userData: [String: Any] = [
            "uid": appState.userProfile.uid,
            "email": appState.userProfile.email,
            "name": appState.userProfile.name,
            "goalCalories": goalCalories,
            "goalWeight": goalWeight,
            "weight": weight,
            "height": height,
            "createdAt": Timestamp() // Firestore timestamp
        ]

        // Get a reference to Firestore
        let db = Firestore.firestore()

        // Save the user data in the 'User' collection with the UID as the document ID
        db.collection("User").document(appState.userProfile.uid).setData(userData) { error in
            if let error = error {
                print("Error saving user to Firestore: \(error.localizedDescription)")
            } else {
                print("User successfully saved to Firestore!")
            }
        }
    }
}

struct HeightScreen: View {
    @Binding var height: String
    var onNext: () -> Void

    var body: some View {
        VStack {
            Text("What is your height?")
                .font(.largeTitle)
                .padding()

            TextField("Enter your height in cm", text: $height)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .keyboardType(.decimalPad)
                .padding()

            Button("Next") {
                onNext()
            }
            .padding()
        }
    }
}

struct WeightScreen: View {
    @Binding var weight: String
    var onNext: () -> Void

    var body: some View {
        VStack {
            Text("What is your weight?")
                .font(.largeTitle)
                .padding()

            TextField("Enter your weight in kg", text: $weight)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .keyboardType(.decimalPad)
                .padding()

            Button("Next") {
                onNext()
            }
            .padding()
        }
    }
}

struct GoalWeightScreen: View {
    @Binding var goalWeight: String
    var onNext: () -> Void

    var body: some View {
        VStack {
            Text("What is your goal weight?")
                .font(.largeTitle)
                .padding()

            TextField("Enter your goal weight in kg", text: $goalWeight)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .keyboardType(.decimalPad)
                .padding()

            Button("Next") {
                onNext()
            }
            .padding()
        }
    }
}

struct GoalCaloriesScreen: View {
    @Binding var goalCalories: String
    var onNext: () -> Void

    var body: some View {
        VStack {
            Text("What is your goal calorie intake?")
                .font(.largeTitle)
                .padding()

            TextField("Enter your goal calories", text: $goalCalories)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .keyboardType(.decimalPad)
                .padding()

            Button("Next") {
                onNext()
            }
            .padding()
        }
    }
}

struct FinalScreen: View {
    var onFinish: () -> Void

    var body: some View {
        VStack {
            Text("Let's do this!")
                .font(.largeTitle)
                .padding()

            Button("Finish") {
                onFinish()
            }
            .padding()
        }
    }
}
