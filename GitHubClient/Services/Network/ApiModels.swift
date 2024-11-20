//
//  ApiModels.swift
//  GithubApp
//
//  Created by Jun Gu on 11/19/24.
//

import Foundation

struct APISimpleResponse: Decodable {
    let rc: Int
    let msg: String
}

struct APIResponse<T: Decodable>: Decodable {
    var rc: Int
    var msg: String
    var data: T
    var meta: MetaResponse?
}

struct MetaResponse: Decodable {
    var currentPage: Int?
    var pageSize: Int?
    var totalPages: Int?
    var totalItems: Int?

    enum CodingKeys: String, CodingKey {
        case currentPage = "current_page"
        case pageSize = "page_size"
        case totalPages = "total_pages"
        case totalItems = "total_items"
    }
}
