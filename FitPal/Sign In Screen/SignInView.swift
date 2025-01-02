//
//  SignInView.swift
//  FitPal
//
//  Created by Lavan Nithi on 2024-11-22.
//

import SwiftUI

@MainActor
final class SignInViewModel: ObservableObject {
    @Published var email: String = ""
    @Published var password: String = ""
    
    func signIn(appState: AppState) async {
        guard !email.isEmpty, !password.isEmpty else {
            print("No email or password found.")
            return
        }
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
                let returnedUserData = try await AuthenticationManager.shared.signIn(email: email, password: password)
                print("Success")
                print(returnedUserData)
                appState.isAuthenticated = true
                appState.userProfile.email = returnedUserData.email ?? "null@gmail.com"
                appState.userProfile.name = returnedUserData.displayName ?? "null"
                appState.userProfile.uid = returnedUserData.uid
                
            } catch {
                print("Error")
            }
        }
        
    }
}

struct SignInView: View {
    @StateObject var viewModel = SignInViewModel()
    @EnvironmentObject var appState: AppState

    var body: some View {
        VStack(spacing: 20) {
            Text("Sign In")
                .font(.largeTitle)
                .fontWeight(.bold)

            TextField("Email", text: $viewModel.email)
                .keyboardType(.emailAddress)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.horizontal)

            SecureField("Password", text: $viewModel.password)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.horizontal)

            Button(action: {
                Task {
                    await viewModel.signIn(appState : appState) // appState: appState to avoid ambiguity
                }
                
            }) {
                Text("Sign In")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }
            .padding(.horizontal)

            Button(action: {
                // Handle forgot password action
            }) {
                Text("Forgot Password?")
                    .foregroundColor(.blue)
            }

            Spacer()

            HStack {
                Text("Don't have an account?")
                Button(action: {
                    // Navigate to Sign-Up screen
                }) {
                    Text("Sign Up")
                        .foregroundColor(.blue)
                }
            }
            .padding(.bottom, 20)
        }
        .padding()
    }
}
