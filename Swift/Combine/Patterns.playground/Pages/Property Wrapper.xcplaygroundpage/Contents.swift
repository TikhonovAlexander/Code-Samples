//: [Previous](@previous)

import UIKit
import Combine

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

final class FormViewController: UIViewController {
    
    @Published var isSubmitAllowed: Bool = false
    
    @IBOutlet private weak var acceptTermsSwitch: UISwitch!
    @IBOutlet private weak var submitButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        $isSubmitAllowed.receive(on: DispatchQueue.main).assign(to: \.isEnabled, on: submitButton)
    }
    
    @IBAction func didSwitch(_ sender: UISwitch) {
        isSubmitAllowed = sender.isOn
    }
}

//: [Next](@next)
