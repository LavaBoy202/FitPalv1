//
//  SignUpView.swift
//  FitPal
//
//  Created by Lavan Nithi on 2024-11-22.
//

import SwiftUI

@MainActor
final class SignUpViewModel: ObservableObject {
    @Published var email: String = ""
    @Published var password: String = ""
    
    func signUp(appState: AppState) async{
        // Check if the password is at least 6 characters long
        guard password.count >= 6 else {
                print("Password must be at least 6 characters long.")
                return
        }
        // Check if the email is valid using a regex
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        guard emailPredicate.evaluate(with: email) else {
            print("Invalid email format.")
            return
        }
        // Check if the password contains at least one letter, one number, and one special character
        let passwordRegex = "^(?=.*[A-Za-z])(?=.*\\d)(?=.*[@$!%*?&#])[A-Za-z\\d@$!%*?&#]{6,15}$"
        let passwordPredicate = NSPredicate(format: "SELF MATCHES %@", passwordRegex)
        guard passwordPredicate.evaluate(with: password) else {
            print("Password must contain at least one letter, one number, and one special character.")
            return
        }
        
        Task {
            do{
                let returnedUserData = try await AuthenticationManager.shared.createUser(email: email, password: password)
                print("Success")
                print(returnedUserData)
                saveUserToFirestore(authResult: returnedUserData)
                try await AuthenticationManager.shared.signIn(email: email, password: password)
                appState.isAuthenticated = true
                let uid = returnedUserData.uid
                if let user = await fetchUser(uid: uid) {
                    print("User fetched: \(user)")
                } else {
                    print("User not found or an error occurred")
                }
            } catch {
                print("Error")
            }
        }
        
    }
}

struct SignUpView: View {
    @State private var fullName: String = ""
    @StateObject var viewModel = SignUpViewModel()
    @EnvironmentObject var appState: AppState

    var body: some View {
        VStack(spacing: 20) {
            Text("Sign Up")
                .font(.largeTitle)
                .fontWeight(.bold)

            TextField("Full Name", text: $fullName)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.horizontal)

            TextField("Email", text: $viewModel.email)
                .keyboardType(.emailAddress)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.horizontal)

            SecureField("Password", text: $viewModel.password)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.horizontal)

            Button(action: {
                print("Authenticating user...")
                Task {
                    await viewModel.signUp(appState : appState) // appState: appState to avoid ambiguity
                }
            }) {
                Text("Sign Up")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }
            .padding(.horizontal)

            Spacer()

            HStack {
                Text("Already have an account?")
                Button(action: {
                    // Navigate to Sign-In screen
                }) {
                    Text("Sign In")
                        .foregroundColor(.blue)
                }
            }
            .padding(.bottom, 20)
        }
        .padding()
    }
}
