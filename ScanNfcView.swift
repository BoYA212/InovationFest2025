import SwiftUI

struct ScanNFCView: View {
    @Binding var isPresented: Bool
    var onScanComplete: (String) -> Void

    var body: some View {
        VStack(spacing: 30) {
            Text("Ready to Scan")
                .font(.title2)
                .fontWeight(.semibold)

            Image(systemName: "wave.3.right.circle.fill")
                .resizable()
                .frame(width: 80, height: 80)
                .foregroundColor(.blue)

            Text("Hold your iPhone near a Tag")
                .font(.subheadline)

            Spacer()

            // Simulate scanning
            Button("Simulate Tag Scan") {
                onScanComplete("TAG_DEMO_123456")
                isPresented = false
            }
            .padding()
            .background(Color.green)
            .foregroundColor(.white)
            .cornerRadius(10)
        }
        .padding()
    }
}
