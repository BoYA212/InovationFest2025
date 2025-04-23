import SwiftUI

struct SettingsView: View {
    @State private var notificationsOn = true
    @State private var darkModeOn = false

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 20) {
                    Text("⚙️ Settings")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .padding(.top)

                    VStack(alignment: .leading, spacing: 16) {
                        Text("🔧 Preferences")
                            .font(.headline)
                            .padding(.horizontal)

                        Toggle("Enable Notifications", isOn: $notificationsOn)
                            .padding(.horizontal)

                        Toggle("Dark Mode", isOn: $darkModeOn)
                            .padding(.horizontal)
                    }
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(12)
                    .shadow(color: Color.black.opacity(0.05), radius: 3, x: 0, y: 2)
                    .padding(.horizontal)

                    VStack(spacing: 10) {
                        Button(role: .destructive) {
                            // Handle logout
                        } label: {
                            HStack {
                                Image(systemName: "arrow.right.square")
                                Text("Log Out")
                            }
                            .frame(maxWidth: .infinity)
                            .padding()
                            .foregroundColor(.white)
                            .background(Color.red)
                            .cornerRadius(12)
                        }
                    }
                    .padding(.horizontal)

                    Spacer()
                }
                .padding(.bottom)
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
    SettingsView()
}
