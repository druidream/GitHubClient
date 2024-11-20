//
//  AuthViewModel.swift
//  GitHubClient
//
//  Created by Jun Gu on 11/21/24.
//

import Foundation
import FirebaseAuth
import FirebaseCore

@MainActor
class AuthViewModel: ObservableObject {
    static let shared = AuthViewModel()
    private init() {
        firUser = Auth.auth().currentUser
    }

    @Published var firUser: FirebaseAuth.User?
    @Published var showError: Bool = false

    func login() async {
        let provider = OAuthProvider(providerID: "github.com")
        provider.customParameters = [
            "allow_signup": "false"
        ]
        do {
            let credential = try await provider.credential(with: nil)
            let authResult = try await Auth.auth().signIn(with: credential)
            guard let accessToken = authResult.credential?.accessToken else { return }
            guard let accountId = Auth.auth().currentUser?.providerData.first?.uid else { return }
            let ghUser = try await UserService.getUserById(id: accountId)
            KeyChainStorage.shared.setAuthToken(authToken: accessToken)
            KeyChainStorage.shared.setUserName(id: ghUser.login)
            firUser = Auth.auth().currentUser
        } catch {
            showError = true
        }
    }

    func logout() {
        do {
            try Auth.auth().signOut()
            firUser = nil
            KeyChainStorage.shared.clear()
        } catch {
            showError = true
        }
    }
}
