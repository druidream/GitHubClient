//
//  RepoRowView.swift
//  GitHubClient
//
//  Created by Jun Gu on 11/21/24.
//

import SwiftUI

struct RepoRowView: View {
    let repo: Repo

    var body: some View {
        VStack(alignment: .leading) {
            Text(repo.name)
                .bold()

            HStack(spacing: 8) {
                if let star = repo.stargazersCount {
                    HStack(spacing: 4) {
                        Image(systemName: "star")
                        Text(String(star))
                    }
                }

                if let language = repo.language {
                    HStack(spacing: 4) {
                        Circle()
                            .fill(.blue)
                            .frame(width: 16, height: 16)
                        Text(String(language))
                    }
                }
                Spacer()
            }
        }
    }
}
