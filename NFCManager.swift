import Foundation
import CoreNFC

class NFCManager: NSObject, ObservableObject, NFCNDEFReaderSessionDelegate {
    static let shared = NFCManager()

    private var session: NFCNDEFReaderSession?
    private var onScanSuccess: ((String) -> Void)?

    func beginScan(onSuccess: @escaping (String) -> Void) {
        guard NFCNDEFReaderSession.readingAvailable else {
            print("NFC not supported on this device")
            return
        }

        self.onScanSuccess = onSuccess
        session = NFCNDEFReaderSession(delegate: self, queue: .main, invalidateAfterFirstRead: true)
        session?.alertMessage = "Hold your iPhone near a tag."
        session?.begin()
    }

    func readerSession(_ session: NFCNDEFReaderSession, didInvalidateWithError error: Error) {
        print("❌ NFC Session Invalidated: \(error.localizedDescription)")
    }

    func readerSession(_ session: NFCNDEFReaderSession, didDetectNDEFs messages: [NFCNDEFMessage]) {
        // Simulate extracting payload text
        if let payload = messages.first?.records.first?.payload,
           let tagText = String(data: payload.dropFirst(3), encoding: .utf8) {
            print("✅ Tag scanned: \(tagText)")
            onScanSuccess?(tagText)
        } else {
            print("❌ Could not read tag")
        }
        session.invalidate()
    }
}
