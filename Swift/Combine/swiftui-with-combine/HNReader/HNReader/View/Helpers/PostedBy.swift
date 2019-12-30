 
 
 import SwiftUI
 
 struct PostedBy: View {
    let time: TimeInterval
    let user: String
    let currentDate: Date
    
    private static var relativeFormatter = RelativeDateTimeFormatter()
    
    private var relativeTimeString: String {
        return PostedBy.relativeFormatter.localizedString(fromTimeInterval: time - self.currentDate.timeIntervalSince1970)
    }
    
    var body: some View {
        Text("\(relativeTimeString) by \(user)")
            .font(.headline)
            .foregroundColor(Color.gray)
    }
 }
