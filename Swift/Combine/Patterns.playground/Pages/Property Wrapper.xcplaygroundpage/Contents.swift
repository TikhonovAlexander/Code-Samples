//: [Previous](@previous)

import Foundation

@propertyWrapper
struct UserDefault<T> {
    let key: String
    let defaultValue: T
    
    init(_ key: String, defaultValue: T) {
        self.key = key
        self.defaultValue = defaultValue
    }
    
    var wrappedValue: T {
        get {
            return UserDefaults.standard.object(forKey: key) as? T ?? defaultValue
        }
        set {
            UserDefaults.standard.set(newValue, forKey: key)
        }
    }
}

struct UserDefaultsConfig {
    @UserDefault("first lanch", defaultValue: false) static var firstLanch: Bool
}

print(UserDefaultsConfig.firstLanch)
UserDefaultsConfig.firstLanch = true
print(UserDefaultsConfig.firstLanch)

//: [Next](@next)
