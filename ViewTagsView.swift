import SwiftUI

struct ViewTagsView: View {
    let tags = [
        Tag(name: "📱 Tag #1", icon: "iphone"),
        Tag(name: "💻 Tag #2", icon: "ipad"),
        Tag(name: "🕶️ Tag #3", icon: "eyeglasses")
    ]

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 16) {
                    Text("🗂 Your Tags")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.primary)
                        .padding(.horizontal)

                    ForEach(tags) { tag in
                        HStack(spacing: 16) {
                            Image(systemName: tag.icon)
                                .font(.title)
                                .foregroundColor(Color("SignalBlue"))
                                .frame(width: 40, height: 40)

                            Text(tag.name)
                                .font(.headline)
                                .foregroundColor(.primary)

                            Spacer()
                        }
                        .padding()
                        .background(Color(.systemGray6))
                        .cornerRadius(12)
                        .shadow(color: Color.black.opacity(0.05), radius: 3, x: 0, y: 2)
                        .padding(.horizontal)
                    }

                    Spacer()
                }
                .padding(.vertical)
            }
            .background(
                LinearGradient(
                    gradient: Gradient(colors: [Color("SignalBlue").opacity(0.05), Color(.systemBackground)]),
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
            )
            .navigationTitle("View Tags")
        }
    }
}

#Preview {
    ViewTagsView()
}
