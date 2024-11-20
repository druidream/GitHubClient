//
//  ApiConfig.swift
//  GithubApp
//
//  Created by Jun Gu on 11/19/24.
//

import Foundation

class ApiConfig {
    static let shared = ApiConfig()
    private init() {}

    let host = "api.github.com"
    private(set) var token = ""

    func setToken(_ token: String) {
        self.token = token
    }
}
