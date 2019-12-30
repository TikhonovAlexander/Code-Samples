 
 
 import SwiftUI
 
 /// A large bordered button view.
 struct LargeInlineButton: View {
    let title: String
    let color = Color.blue
    let action: () -> Void
    
    var body: some View {
        Button(title, action: self.action)
            .scaleEffect(0.8)
            .font(.title)
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 60, alignment: .center)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .overlay(RoundedRectangle(cornerRadius: 10).stroke(color, lineWidth: 2))
            .padding(.leading, 40)
            .padding(.trailing, 40)
    }
 }
 
 #if DEBUG
 struct LargeInlineButton_Previews: PreviewProvider {
    static var previews: some View {
        LargeInlineButton(title: "Button!", action: {})
    }
 }
 #endif
