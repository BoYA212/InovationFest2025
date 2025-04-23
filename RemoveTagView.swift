import SwiftUI

struct RemoveTagView: View {
    @State private var tags: [Tag] = [
        Tag(name: "📱 Tag #1", icon: "iphone"),
        Tag(name: "💻 Tag #2", icon: "ipad"),
        Tag(name: "🕶️ Tag #3", icon: "eyeglasses")
    ]

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 16) {
                    Text("🗑 Remove Tags")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.primary)
                        .padding(.horizontal)

                    ForEach(tags) { tag in
                        HStack(spacing: 16) {
                            Image(systemName: tag.icon)
                                .font(.title2)
                                .foregroundColor(Color("SignalBlue"))

                            Text(tag.name)
                                .font(.headline)

                            Spacer()

                            Button(action: {
                                remove(tag)
                            }) {
                                Image(systemName: "minus.circle.fill")
                                    .foregroundColor(.red)
                                    .font(.title2)
                            }
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
                    gradient: Gradient(colors: [
                        Color("SignalBlue").opacity(0.05),
                        Color(.systemBackground)
                    ]),
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
            )
            .navigationTitle("Remove Tags")
        }
    }

    func remove(_ tag: Tag) {
        if let index = tags.firstIndex(where: { $0.id == tag.id }) {
            tags.remove(at: index)
        }
    }
}

#Preview {
    RemoveTagView()
}
