//
//  LoginPage.swift
//  GithubApp
//
//  Created by Jun Gu on 11/19/24.
//

import SwiftUI

struct LoginPage: View {
    @ObservedObject var authViewModel = AuthViewModel.shared
    @ObservedObject var homeViewModel = HomeViewModel.shared
    @ObservedObject var profileViewModel = ProfileViewModel.shared

    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        NavigationView {
            VStack(spacing: 16) {
                Button {
                    loginButtonTapped()
                } label: {
                    HStack {
                        Image(.logo)
                            .resizable()
                            .renderingMode(.template)
                            .scaledToFit()
                            .frame(width: 32, height: 32)
                            .foregroundColor(.white)

                        Text("Sign in with GitHub")
                            .foregroundColor(.white)
                    }
                    .padding()
                    .background(Color.blue)
                    .clipShape(RoundedRectangle(cornerRadius: 16))
                }
            }
            .navigationTitle("Login")
        }
    }

    func loginButtonTapped() {
        Task {
            await authViewModel.login()
            await profileViewModel.getUser()
            await homeViewModel.listUserRepos()
            presentationMode.wrappedValue.dismiss()
        }
    }
}

#Preview {
    LoginPage()
}
