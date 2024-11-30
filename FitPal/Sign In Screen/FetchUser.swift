//
//  FetchUser.swift
//  FitPal
//
//  Created by Lavan Nithi on 2024-11-29.
//

import FirebaseFirestore

func fetchUser(uid: String) async -> UserModel? {
    let db = Firestore.firestore()
    let docRef = db.collection("User").document(uid)
    
    do {
        let document = try await docRef.getDocument()
        if document.exists, let userData = document.data() {
            print(userData)
            return UserModel(userData: userData)
        }else{
            return nil
        }
    }catch{
        print("Error getting document: \(error)")
        return nil
    }
}

