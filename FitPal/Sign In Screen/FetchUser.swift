//
//  FetchUser.swift
//  FitPal
//
//  Created by Lavan Nithi on 2024-11-29.
//

import FirebaseFirestore

func fetchUser(uid: String) async -> UserModel? {
    print(uid)
    let db = Firestore.firestore()
    let docRef = db.collection("User").document(uid)
    
    do {
        let document = try await docRef.getDocument()
        if document.exists, let userData = document.data() {
            print(userData)
            print("document exists")
            print(UserModel(userData: userData))
            return UserModel(userData: userData)
        }else{
            print("null")
            return nil
        }
    }catch{
        print("Error getting document: \(error)")
        return nil
    }
}

