//
//  KeychainStore.swift
//  game
//
//  Created by Tikhonov, Aleksandr on 20.10.20.
//

import Foundation
import Security

class KeychainStore {

    private static let service = "Service"
    private static let account = "Account"
    private static let accessGroup = "YOURTEAMID.com.uninova.shareditems"

    static func store(_ string: String) {
        let data = Data(string.utf8)
        let attributes = [kSecClass: kSecClassGenericPassword,
                          kSecAttrService: service,
                          kSecAttrAccount: account,
                          kSecAttrAccessGroup: accessGroup,
                          kSecValueData: data] as [String: Any]
        let addStatus = SecItemAdd(attributes as CFDictionary, nil)
        guard addStatus == errSecSuccess else {
            fatalError("Unable to store item: \(addStatus.message)")
        }
    }

    static func read() -> String? {
        let query = [kSecClass: kSecClassGenericPassword,
                     kSecAttrService: service,
                     kSecAttrAccount: account,
                     kSecReturnAttributes: true,
                     kSecAttrAccessGroup: accessGroup,
                     kSecReturnData: true] as [String: Any]
        var item: CFTypeRef?
        let readStatus = SecItemCopyMatching(query as CFDictionary, &item)

        switch readStatus {
        case errSecSuccess:
            guard let dict = item as? [String: Any] else { return nil }
            guard let data = dict[kSecValueData as String] as? Data else { return nil }
            return String(decoding: data, as: UTF8.self)
        case errSecItemNotFound:
            return nil
        case errSecMissingEntitlement:
            fatalError()
        case let status:
            fatalError("Keychain read failed: \(status.message)")
        }
    }

    static func roundTrip(_ string: String) -> String? {
        deleteKey()
        store(string)
        return read()
    }

    static func deleteKey() {
        let query = [kSecClass: kSecClassGenericPassword,
                     kSecAttrAccount: account] as [String: Any]
        switch SecItemDelete(query as CFDictionary) {
        case errSecItemNotFound, errSecSuccess: break // Okay to ignore
        case let status:
            fatalError("Unexpected deletion error: \(status.message)")
        }
    }
}

extension OSStatus {
    var message: String {
        return (SecCopyErrorMessageString(self, nil) as String?) ?? String(self)
    }
}
