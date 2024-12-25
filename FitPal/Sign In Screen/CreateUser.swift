//
//  CreateUser.swift
//  FitPal
//
//  Created by Lavan Nithi on 2024-11-29.
//

import Firebase
import FirebaseFirestore
import FirebaseAuth

func saveUserToFirestore(authResult: AuthDataResultModel) {
    // Get the authenticated user's information
    
    let uid = authResult.uid
    let email = authResult.email ?? "No email"
    let name = ""
    let goalCalories = 0
    let goalWeight = 0
    let weight = 0
    let height = 0

    // Prepare the user data to save
    let userData: [String: Any] = [
        "uid": uid,
        "email": email,
        "name": name,
        "goalCalories": goalCalories,
        "goalWeight": goalWeight,
        "weight": weight,
        "height": height,
        "createdAt": Timestamp() // Firestore timestamp
    ]

    // Get a reference to Firestore
    let db = Firestore.firestore()

    // Save the user data in the 'User' collection with the UID as the document ID
    db.collection("User").document(uid).setData(userData) { error in
        if let error = error {
            print("Error saving user to Firestore: \(error.localizedDescription)")
        } else {
            print("User successfully saved to Firestore!")
        }
    }
}
