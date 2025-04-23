// TagAddedView.swift
import SwiftUI

struct TagAddedView: View {
    @Environment(\.dismiss) var dismiss
    var tagName: String

    var body: some View {
        VStack(spacing: 30) {
            Spacer()

            Image(systemName: "checkmark.circle.fill")
                .resizable()
                .frame(width: 100, height: 100)
                .foregroundColor(.green)

            Text("Tag Added!")
                .font(.largeTitle)
                .fontWeight(.bold)

            Text("\"\(tagName)\" was successfully added.")
                .font(.headline)
                .multilineTextAlignment(.center)

            Spacer()

            Button(action: {
                dismiss()
            }) {
                Text("Return to Main Menu")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(12)
            }
            .padding(.horizontal)

            Spacer()
        }
        .padding()
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    TagAddedView(tagName: "Demo Tag")
}
