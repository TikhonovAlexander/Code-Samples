import Foundation

public class TimeLogger: TextOutputStream {
    var previous = Date()
    let formatter = NumberFormatter()
    let sinceOrigin: Bool
    
    public init(sinceOrigin: Bool = false) {
        formatter.maximumFractionDigits = 5
        formatter.minimumFractionDigits = 5
        self.sinceOrigin = sinceOrigin
    }
    
    public func write(_ string: String) {
        let trimmed = string.trimmingCharacters(in: .whitespacesAndNewlines)
        guard !trimmed.isEmpty else { return }
        let now = Date()
        print("+\(formatter.string(for: now.timeIntervalSince(previous))!)s: \(string)")
        if !sinceOrigin {
            previous = now
        }
    }
}

