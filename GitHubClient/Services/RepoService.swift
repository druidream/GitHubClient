//
//  RepoService.swift
//  GitHubClient
//
//  Created by Jun Gu on 11/20/24.
//

import Foundation

struct RepoService {
    static func getRepos() async throws -> [Repo] {
        try await ApiClient().request(RepoEndpoints.getRepos, type: [Repo].self)
    }

    static func getUserRepos(username: String) async throws -> [Repo] {
        try await ApiClient().request(RepoEndpoints.getUserRepos(username: username), type: [Repo].self)
    }
}
