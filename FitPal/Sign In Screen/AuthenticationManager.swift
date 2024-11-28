//
//  AuthenticationManager.swift
//  FitPal
//
//  Created by Lavan Nithi on 2024-11-22.
//

import Foundation
import FirebaseAuth

struct AuthDataResultModel {
    let uid: String
    let email: String?
    let photUrl: String?
    
    init(user: User){
        self.uid = user.uid
        self.email = user.email
        self.photUrl = user.photoURL?.absoluteString
    }
}

final class AuthenticationManager {
    
    static let shared = AuthenticationManager()
    private init() { }
    
    func createUser(email: String, password: String) async throws -> AuthDataResultModel {
        let authDataResult = try await FirebaseAuth.Auth.auth().createUser(withEmail: email, password: password)
        return AuthDataResultModel(user: authDataResult.user)
    }
    func signIn(email: String, password: String) async throws -> AuthDataResultModel {
        let authDataResult = try await FirebaseAuth.Auth.auth().signIn(withEmail: email, password: password)
        return AuthDataResultModel(user: authDataResult.user)
    }
    func signOut() throws {
        do{
            try Auth.auth().signOut()
        }catch {
            print("Error signing out: \(error.localizedDescription)")
        }
    }
}
