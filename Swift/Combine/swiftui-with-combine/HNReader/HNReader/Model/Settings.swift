import Combine
import Foundation

final class Settings: ObservableObject {
    init() { }
    
    @Published var keywords = [FilterKeyword]()
}
