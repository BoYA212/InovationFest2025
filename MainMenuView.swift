import SwiftUI

struct MainMenuView: View {
    @State private var isScanning = false
    @State private var scannedTagID: String? = nil
    @State private var navigateToAddTag = false

    var body: some View {
        NavigationStack {
            VStack(spacing: 30) {
                // Top bar
                HStack {
                    Spacer()
                    NavigationLink(destination: SettingsView()) {
                        Image(systemName: "gearshape.fill")
                            .font(.title2)
                            .foregroundColor(.primary)
                            .padding()
                    }
                }

                Text("🏠 Main Menu")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.primary)

                // Menu buttons
                VStack(spacing: 20) {
                    Button {
                        isScanning = true
                    } label: {
                        MainMenuButton(icon: "plus.circle.fill", text: "➕ Add Tag", color: Color("SignalBlue"))
                    }

                    NavigationLink(destination: ViewTagsView()) {
                        MainMenuButton(icon: "list.bullet.rectangle", text: "🗂 View Tags", color: .green)
                    }

                    NavigationLink(destination: RemoveTagView()) {
                        MainMenuButton(icon: "minus.circle.fill", text: "🗑 Remove Tags", color: .red)
                    }
                }

                Spacer()

                NavigationLink(destination: AddTagView(scannedTagID: scannedTagID ?? ""), isActive: $navigateToAddTag) {
                    EmptyView()
                }
            }
            .background(
                LinearGradient(
                    gradient: Gradient(colors: [
                        Color("SignalBlue").opacity(0.08),
                        Color(.systemBackground)
                    ]),
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
            )
            .sheet(isPresented: $isScanning) {
                ScanNFCView(isPresented: $isScanning) { tagID in
                    scannedTagID = tagID
                    navigateToAddTag = true
                }
            }
        }
    }
}

struct MainMenuButton: View {
    let icon: String
    let text: String
    let color: Color

    var body: some View {
        HStack(spacing: 16) {
            Image(systemName: icon)
                .foregroundColor(color)
                .font(.title2)
            Text(text)
                .foregroundColor(.primary)
                .font(.headline)
            Spacer()
        }
        .padding()
        .background(Color(.systemGray5))
        .cornerRadius(12)
        .shadow(color: Color.black.opacity(0.05), radius: 3, x: 0, y: 2)
        .padding(.horizontal)
    }
}
