//
//  HomeViewModel.swift
//  GitHubClient
//
//  Created by Jun Gu on 11/21/24.
//

import Foundation

@MainActor
class HomeViewModel: ObservableObject {
    static let shared = HomeViewModel()
    private init() {
        Task {
            await listUserRepos()
        }
    }

    @Published var repos: [Repo] = []
    @Published var searchText: String = ""
    @Published var showError: Bool = false

    var filteredRepos: [Repo] {
        if searchText.isEmpty { return repos }
        return repos.filter { $0.name.contains(searchText) }
    }

    func listPublicRepos() async {
        do {
            repos = try await RepoService.getRepos()
        } catch {
            showError = true
        }
    }

    func listUserRepos() async {
        do {
            guard let userName = KeyChainStorage.shared.getUserName() else { return }
            repos = try await RepoService.getUserRepos(username: userName)
        } catch {
            showError = true
        }
    }
}
