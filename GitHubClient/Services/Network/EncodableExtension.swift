//
//  EncodableExtension.swift
//  GithubApp
//
//  Created by Jun Gu on 11/19/24.
//

import Foundation

extension Encodable {
    var toDictionary: [String: Any]? {
        guard let data = try? JSONEncoder().encode(self) else { return nil }
        return (try? JSONSerialization.jsonObject(with: data, options: .allowFragments)).flatMap({ $0 as? [String: Any] })
    }

    var jsonString: String? {
        let encoder = JSONEncoder()
        encoder.outputFormatting = .prettyPrinted
        guard let jsonData = try? encoder.encode(self) else {
            return nil
        }
        return String(data: jsonData, encoding: .utf8)
    }
}
