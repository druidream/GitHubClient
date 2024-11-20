//
//  ErrorPage.swift
//  GitHubClient
//
//  Created by Jun Gu on 11/21/24.
//

import SwiftUI

struct ErrorPage: View {

    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        NavigationView {
            VStack {
                Text("Oops")
                    .font(.headline)
                Text("Some went wrong.")
            }
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        presentationMode.wrappedValue.dismiss()
                    } label: {
                        Image(systemName: "xmark")
                    }
                }
            }
        }
    }
}

#Preview {
    ErrorPage()
}
