//
//  Defaults.swift
//  chat-app-ios
//
//  Created by Huy Pham on 20/06/2023.
//

import Foundation


class DefaultsKeys {
    // ===== DEFINE NEW KEY HERE
    static let accessToken = DefaultsKey<String>("accessToken")
    static let refreshToken = DefaultsKey<String>("refreshToken")

}

final class DefaultsKey<T>: DefaultsKeys {
    let value: String

    init(_ value: String) {
        self.value = value
    }
}

// MARK: - with UserDefaults

struct Defaults {
    static func set<T>(_ key: DefaultsKey<T>, value: T) {
        UserDefaults.standard.set(value, forKey: key.value)
        UserDefaults.standard.synchronize()
    }

    static func clear<T>(_ key: DefaultsKey<T>) {
        UserDefaults.standard.set(nil, forKey: key.value)
        UserDefaults.standard.synchronize()
    }

    static func get<T>(_ key: DefaultsKey<T>) -> T? {
        return UserDefaults.standard.object(forKey: key.value) as? T
    }
}
