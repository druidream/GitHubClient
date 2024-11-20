//
//  UserEndpoints.swift
//  GitHubClient
//
//  Created by Jun Gu on 11/20/24.
//

import Foundation

enum UserEndpoints: EndpointProvider {
    case getUserById(id: String)
    case getUserByUserName(userName: String)

    var path: String {
        switch self {
        case .getUserById(let id):
            return "/user/\(id)"
        case .getUserByUserName(let userName):
            return "/users/\(userName)"
        }
    }

    var method: RequestMethod {
        switch self {
        case .getUserById:
            return .get
        case .getUserByUserName:
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
