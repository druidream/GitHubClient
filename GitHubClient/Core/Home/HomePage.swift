//
//  HomePage.swift
//  GithubApp
//
//  Created by Jun Gu on 11/19/24.
//

import SwiftUI

struct HomePage: View {
    @State private var showLogin = false

    @ObservedObject var authViewModel = AuthViewModel.shared
    @ObservedObject var homeViewModel = HomeViewModel.shared

    var body: some View {
        NavigationView {
            if authViewModel.firUser != nil {
                List {
                    Section {
                        TextField("search", text: $homeViewModel.searchText)
                    }

                    ForEach(homeViewModel.filteredRepos) { repo in
                        RepoRowView(repo: repo)
                    }
                }
                .navigationTitle("Home")
            } else {
                Button {
                    showLogin.toggle()
                } label: {
                    Text("Login")
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.blue)
                        .clipShape(RoundedRectangle(cornerRadius: 16))
                }
            }
        }
        .sheet(isPresented: $showLogin) {
            LoginPage()
        }
        .fullScreenCover(isPresented: $homeViewModel.showError) {
            ErrorPage()
        }
    }
}

#Preview {
    HomePage()
}
