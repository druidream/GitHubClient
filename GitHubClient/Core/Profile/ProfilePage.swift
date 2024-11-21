//
//  ProfilePage.swift
//  GithubApp
//
//  Created by Jun Gu on 11/19/24.
//

import SwiftUI
import Kingfisher

struct ProfilePage: View {
    @State private var showLogin = false

    @ObservedObject var authViewModel = AuthViewModel.shared
    @ObservedObject var profileViewModel = ProfileViewModel.shared

    var body: some View {
        NavigationView {
            if let user = profileViewModel.user {
                profileView(user)
                    .navigationTitle("Profile")
                    .toolbar {
                        ToolbarItem(placement: .topBarTrailing) {
                            Button {
                                logoutButtonTapped()
                            } label: {
                                Text("Logout")
                            }

                        }
                    }
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
        .fullScreenCover(isPresented: $profileViewModel.showError) {
            ErrorPage()
        }
        .sheet(isPresented: $showLogin) {
            LoginPage()
        }
    }

    @ViewBuilder
    func profileView(_ user: User) -> some View {
        List {
            Section {
                VStack(alignment: .leading, spacing: 16) {
                    HStack(spacing: 16) {
                        KFImage(URL(string: user.avatarUrl))
                            .resizable()
                            .scaledToFill()
                            .frame(width: 64, height: 64)
                            .clipShape(Circle())

                        VStack(alignment: .leading) {
                            Text(user.name ?? "")
                                .font(.headline)

                            Text(user.login)
                        }

                        Spacer()
                    }

                    if let bio = user.bio {
                        Section {
                            Text(bio)
                        }
                    }
                }
            }

            Section {
                if let location = user.location {
                    HStack {
                        Image(systemName: "mappin.and.ellipse")
                            .frame(width: 16, height: 16)
                        Text(location)
                    }
                }

                HStack {
                    Image(systemName: "person.2")
                        .frame(width: 16, height: 16)
                    Text(String(user.followers))
                        .bold()
                    Text("followers")
                    Text(String(user.following))
                        .bold()
                    Text("following")
                }
            }
        }
    }

    func logoutButtonTapped() {
        authViewModel.logout()
        profileViewModel.user = nil
    }
}

#Preview {
    ProfilePage()
}
