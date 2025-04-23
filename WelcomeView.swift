import SwiftUI

struct WelcomeView: View {
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 30) {
                    Spacer()

                    Image("SignalMuseLogo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 150, height: 150)
                        .padding()

                    Text("🎧 Signal Muse")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.primary)
                        .padding(.bottom, 10)

                    NavigationLink(destination: LoginView()) {
                        Text("🔐 Log In")
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color("SignalBlue"))
                            .foregroundColor(.white)
                            .cornerRadius(12)
                            .shadow(color: Color.black.opacity(0.1), radius: 4, x: 0, y: 2)
                    }

                    NavigationLink(destination: SignUpView()) {
                        Text("📝 Sign Up")
                            .frame(maxWidth: .infinity)
                            .padding()
                            .foregroundColor(Color("SignalBlue"))
                            .overlay(
                                RoundedRectangle(cornerRadius: 12)
                                    .stroke(Color("SignalBlue"), lineWidth: 2)
                            )
                            .shadow(color: Color.black.opacity(0.05), radius: 2, x: 0, y: 1)
                    }

                    Spacer()
                }
                .padding()
            }
            .background(
                LinearGradient(
                    gradient: Gradient(colors: [
                        Color("SignalBlue").opacity(0.05),
                        Color(.systemBackground)
                    ]),
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
            )
        }
    }
}

#Preview {
    WelcomeView()
}
