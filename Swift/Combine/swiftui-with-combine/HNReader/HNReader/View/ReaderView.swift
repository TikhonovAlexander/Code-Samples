import SwiftUI
import Combine

struct ReaderView: View {
    @ObservedObject var model: ReaderViewModel
    @State var presentingSettingsSheet = false
    
    @State var currentDate = Date()
    @EnvironmentObject var settings: Settings
    
    private let timer = Timer.publish(every: 10, on: .main, in: .common)
        .autoconnect()
        .eraseToAnyPublisher()
    
    @Environment(\.colorScheme) var colorScheme: ColorScheme
    
    init(model: ReaderViewModel) {
        self.model = model
    }
    
    var body: some View {
        let filter = "Showing all stories"
        
        return NavigationView {
            List {
                Section(header: Text(filter).padding(.leading, -10)) {
                    ForEach(self.model.stories) { story in
                        VStack(alignment: .leading, spacing: 10) {
                            TimeBadge(time: story.time)
                            
                            Text(story.title)
                                .frame(minHeight: 0, maxHeight: 100)
                                .font(.title)
                            
                            PostedBy(time: story.time, user: story.by, currentDate: self.currentDate)
                            
                            Button(story.url) {
                                print(story)
                            }
                            .font(.subheadline)
                            .foregroundColor(self.colorScheme == .light ? .blue : .orange)
                            .padding(.top, 6)
                        }
                        .padding()
                    }
                    .onReceive(timer) {
                        self.currentDate = $0
                    }
                }.padding()
            }
            .sheet(isPresented: self.$presentingSettingsSheet, content: {
                SettingsView()
                    .environmentObject(self.settings)
            })
                .alert(item: self.$model.error) { error in
                    Alert(
                        title: Text("Network error"),
                        message: Text(error.localizedDescription),
                        dismissButton: .cancel()
                    )
            }
            .navigationBarTitle(Text("\(self.model.stories.count) Stories"))
            .navigationBarItems(trailing:
                Button("Settings") {
                    self.presentingSettingsSheet = true
                    
                }
            )
        }
    }
}

#if DEBUG
struct ReaderView_Previews: PreviewProvider {
    static var previews: some View {
        ReaderView(model: ReaderViewModel())
    }
}
#endif
