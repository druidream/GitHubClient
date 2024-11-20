//
//  KeyChainStorage.swift
//  Twindly
//
//  Created by Jun Gu on 8/13/24.
//

import Foundation
import KeychainSwift

class KeyChainStorage {
    static let shared = KeyChainStorage()

    private let keychain = KeychainSwift()

    let AUTH_TOKEN: String = "AUTH_TOKEN"
    let REFRESH_TOKEN: String = "REFRESH_TOKEN"
    let USER_NAME: String = "USER_NAME"

    private init() { }

    func getAuthToken() -> String? {
        keychain.get(AUTH_TOKEN)
    }

    func getRefreshToken() -> String? {
        keychain.get(REFRESH_TOKEN)
    }

    func getUserName() -> String? {
        keychain.get(USER_NAME)
    }

    @discardableResult
    func setAuthToken(authToken: String) -> Bool {
        keychain.set(authToken, forKey: AUTH_TOKEN)
    }

    func setRefreshToken(token: String) {
        keychain.set(token, forKey: REFRESH_TOKEN)
    }

    @discardableResult
    func setUserName(id: String) -> Bool {
        keychain.set(id, forKey: USER_NAME)
    }

    func deleteTokens() {
        keychain.delete(AUTH_TOKEN)
        keychain.delete(REFRESH_TOKEN)
    }

    func clear() {
        keychain.clear()
    }
}

