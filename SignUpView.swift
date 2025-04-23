import SwiftUI

struct SignUpView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var confirmPassword: String = ""
    @State private var goToMainMenu = false

    @State private var showAlert = false
    @State private var alertMessage = ""
    @State private var isLoading = false

    var body: some View {
        VStack(spacing: 20) {
            Text("Create Account")
                .font(.title)
                .fontWeight(.bold)

            TextField("Email", text: $email)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .keyboardType(.emailAddress)
                .autocapitalization(.none)

            SecureField("Password", text: $password)
                .textFieldStyle(RoundedBorderTextFieldStyle())

            SecureField("Confirm Password", text: $confirmPassword)
                .textFieldStyle(RoundedBorderTextFieldStyle())

            if isLoading {
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle(tint: Color("SignalBlue")))
            } else {
                Button("Sign Up") {
                    signUp()
                }
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color("SignalBlue"))
                .foregroundColor(.white)
                .cornerRadius(12)
                .padding(.horizontal)
            }

            Spacer()
        }
        .padding()
        .navigationDestination(isPresented: $goToMainMenu) {
            MainMenuView()
        }
        .alert("Sign Up", isPresented: $showAlert) {
            Button("OK", role: .cancel) {
                if alertMessage == "Account created successfully!" {
                    goToMainMenu = true
                }
            }
        } message: {
            Text(alertMessage)
        }
    }

    func signUp() {
        // Input validation
        guard !email.isEmpty, email.contains("@") else {
            alertMessage = "Please enter a valid email."
            showAlert = true
            return
        }

        guard password.count >= 6 else {
            alertMessage = "Password must be at least 6 characters."
            showAlert = true
            return
        }

        guard password == confirmPassword else {
            alertMessage = "Passwords do not match."
            showAlert = true
            return
        }

        // Simulate loading and success
        isLoading = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            isLoading = false
            alertMessage = "Account created successfully!"
            showAlert = true
        }
    }
}

#Preview {
    SignUpView()
}
