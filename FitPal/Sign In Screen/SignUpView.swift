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
        Task {
            do{
                let returnedUserData = try await AuthenticationManager.shared.createUser(email: email, password: password)
                print("Success")
                print(returnedUserData)

                try await AuthenticationManager.shared.signIn(email: email, password: password)
                appState.isAuthenticated = true
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
