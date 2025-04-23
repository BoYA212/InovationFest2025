import SwiftUI

struct MenuView: View {
    @State private var isScanning = false
    @State private var scannedTagID: String? = nil
    @State private var navigateToAddTag = false

    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                // Title and Nav Bar
                HStack {
                    Button(action: {
                        // Handle back
                    }) {
                        Image(systemName: "arrow.uturn.backward")
                            .font(.title2)
                            .padding()
                    }

                    Spacer()

                    Text("Menu")
                        .font(.largeTitle)
                        .bold()

                    Spacer()

                    Button(action: {
                        // Handle settings
                    }) {
                        Image(systemName: "gearshape.fill")
                            .font(.title2)
                            .padding()
                    }
                }

                Spacer()

                // Menu Buttons
                VStack(spacing: 20) {
                    MenuButton(icon: "plus.square", text: "Add Stickit’s") {
                        isScanning.toggle() // trigger scan NFC sheet
                    }

                    MenuButton(icon: "magnifyingglass.circle", text: "View Stickit’s") {
                        // Navigate to view page
                    }

                    MenuButton(icon: "minus.square", text: "Remove Stickit’s") {
                        // Navigate to remove page
                    }
                }
                .padding(.horizontal)

                Spacer()

                NavigationLink(destination: AddTagView(scannedTagID: scannedTagID ?? ""), isActive: $navigateToAddTag) {
                    EmptyView()
                }
            }
            .sheet(isPresented: $isScanning) {
                ScanNFCView(isPresented: $isScanning) { scannedTag in
                    // Save scanned tag and trigger navigation
                    scannedTagID = scannedTag
                    navigateToAddTag = true
                }
            }
        }
    }
}

struct MenuButton: View {
    var icon: String
    var text: String
    var action: () -> Void

    var body: some View {
        Button(action: action) {
            HStack {
                Image(systemName: icon)
                    .font(.title2)
                Text(text)
                    .fontWeight(.semibold)
            }
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color.gray.opacity(0.2))
            .cornerRadius(15)
        }
        .foregroundColor(.black)
    }
}
