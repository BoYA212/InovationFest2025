import SwiftUI

struct AddTagView: View {
    var scannedTagID: String

    @State private var tagName: String
    @State private var selectedIcon: String = "tag"
    @State private var showTagAddedView = false

    let icons = ["tag", "iphone", "ipad", "eyeglasses", "backpack", "laptopcomputer", "tv", "gamecontroller"]

    init(scannedTagID: String) {
        self.scannedTagID = scannedTagID
        _tagName = State(initialValue: scannedTagID)
    }

    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                Text("📡 Scanned Tag")
                    .font(.headline)

                Text(scannedTagID)
                    .font(.subheadline)
                    .foregroundColor(.gray)

                Text("➕ Add New Tag")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.primary)

                TextField("Enter tag name", text: $tagName)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.horizontal)

                Text("🎨 Select Icon")
                    .font(.headline)

                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 20) {
                        ForEach(icons, id: \.self) { icon in
                            Image(systemName: icon)
                                .font(.title)
                                .padding()
                                .background(selectedIcon == icon ? Color("SignalBlue").opacity(0.2) : Color.clear)
                                .cornerRadius(10)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(selectedIcon == icon ? Color("SignalBlue") : Color.gray.opacity(0.3), lineWidth: 2)
                                )
                                .onTapGesture {
                                    selectedIcon = icon
                                }
                        }
                    }
                    .padding(.horizontal)
                }

                Spacer()

                Button(action: {
                    showTagAddedView = true
                }) {
                    Text("✅ Add Tag")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color("SignalBlue"))
                        .foregroundColor(.white)
                        .cornerRadius(12)
                        .shadow(color: Color.black.opacity(0.1), radius: 4, x: 0, y: 2)
                }
                .padding(.horizontal)

                Spacer()
            }
            .padding()
        }
        .background(
            LinearGradient(
                gradient: Gradient(colors: [Color("SignalBlue").opacity(0.05), Color(.systemBackground)]),
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
        )
        .navigationTitle("Add Tag")
        .navigationDestination(isPresented: $showTagAddedView) {
            TagAddedView(tagName: tagName)
        }
    }
}
