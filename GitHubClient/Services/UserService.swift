//
//  UserService.swift
//  GitHubClient
//
//  Created by Jun Gu on 11/20/24.
//

import Foundation

struct UserService {
    static func getUserById(id: String) async throws -> User {
        try await ApiClient().request(UserEndpoints.getUserById(id: id), type: User.self)
    }

    static func getUserByUserName(userName: String) async throws -> User {
        try await ApiClient().request(UserEndpoints.getUserByUserName(userName: userName), type: User.self)
    }
}
