import SwiftUI

struct LoginView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var showAlert = false
    @State private var alertMessage = ""
    @State private var isLoading = false
    @State private var goToMainMenu = false

    var body: some View {
        VStack(spacing: 20) {
            Text("🔐 Sign In")
                .font(.title)
                .fontWeight(.bold)

            TextField("Email", text: $email)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .keyboardType(.emailAddress)
                .autocapitalization(.none)

            SecureField("Password", text: $password)
                .textFieldStyle(RoundedBorderTextFieldStyle())

            if isLoading {
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle(tint: Color("SignalBlue")))
            } else {
                Button("Sign In") {
                    login()
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
        .alert("Login", isPresented: $showAlert) {
            Button("OK", role: .cancel) {
                if alertMessage == "Login successful!" {
                    goToMainMenu = true
                }
            }
        } message: {
            Text(alertMessage)
        }
    }

    func login() {
        guard !email.isEmpty, email.contains("@") else {
            alertMessage = "Please enter a valid email."
            showAlert = true
            return
        }

        guard !password.isEmpty else {
            alertMessage = "Password cannot be empty."
            showAlert = true
            return
        }

        isLoading = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            isLoading = false
            alertMessage = "Login successful!"
            showAlert = true
        }
    }
}

#Preview {
    LoginView()
}
