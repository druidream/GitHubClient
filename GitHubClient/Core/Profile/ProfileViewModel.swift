//
//  ProfileViewModel.swift
//  GitHubClient
//
//  Created by Jun Gu on 11/21/24.
//

import Foundation

@MainActor
class ProfileViewModel: ObservableObject {
    static let shared = ProfileViewModel()
    private init() {
        Task {
            await getUser()
        }
    }

    @Published var user: User?
    @Published var showError: Bool = false

    func getUser() async {
        do {
            guard let userName = KeyChainStorage.shared.getUserName() else { return }
            user = try await UserService.getUserByUserName(userName: userName)
        } catch {
            showError = true
        }
    }
}
