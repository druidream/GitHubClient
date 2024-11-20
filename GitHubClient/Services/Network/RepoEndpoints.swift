//
//  RepoEndpoints.swift
//  GitHubClient
//
//  Created by Jun Gu on 11/20/24.
//

import Foundation

enum RepoEndpoints: EndpointProvider {
    case getRepos
    case getUserRepos(username: String)

    var path: String {
        switch self {
        case .getRepos:
            return "/repositories"
        case .getUserRepos(let username):
            return "/users/\(username)/repos"
        }
    }

    var method: RequestMethod {
        switch self {
        case .getRepos:
            return .get
        case .getUserRepos:
            return .get
        }
    }

    var queryItems: [URLQueryItem]? {
        switch self {
        default:
            return nil
        }
    }

    var body: [String : Any]? {
        switch self {
        default:
            return nil
        }
    }
}
