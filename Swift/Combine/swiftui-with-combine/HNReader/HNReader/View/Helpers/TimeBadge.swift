 
 
 import SwiftUI
 
 /// A view displaying an "hour:minutes" badge.
 struct TimeBadge: View {
    private static var formatter: DateFormatter = {
        let f = DateFormatter()
        f.dateStyle = .none
        f.timeStyle = .short
        return f
    }()
    
    let time: TimeInterval
    
    var body: some View {
        Text(TimeBadge.formatter.string(from: Date(timeIntervalSince1970: time)))
            .font(.headline)
            .fontWeight(.heavy)
            .padding(10)
            .foregroundColor(Color.white)
            .background(Color.orange)
            .cornerRadius(6)
            .frame(idealWidth: 100)
            .padding(.bottom, 10)
    }
 }
 
 #if DEBUG
 struct TimeBadge_Previews: PreviewProvider {
    static var previews: some View {
        TimeBadge(time: Date().timeIntervalSince1970)
    }
 }
 #endif
