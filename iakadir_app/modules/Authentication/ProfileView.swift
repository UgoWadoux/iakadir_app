//
//  ProfileView.swift
//  iakadir_app
//
//  Created by Ugo Wadoux on 13/12/2024.
//

import SwiftUI

import SwiftUI

struct ProfileView: View {

    
    @State var isLoading = false
    @StateObject private var viewModel = ProfileViewModel()

    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    TextField("Prénom", text: $viewModel.firstName)
                        .textContentType(.username)
                        .textInputAutocapitalization(.never)
                    TextField("Nom", text: $viewModel.lastName)
                        .textContentType(.name)
                    TextField("email", text: $viewModel.email)
                        .textContentType(.URL)
                        .textInputAutocapitalization(.never)
                }
                
                Section {
                    Button("Update profile") {
//                        updateProfileButtonTapped()
                    }
                    .bold()
                    
                    if isLoading {
                        ProgressView()
                    }
                }
            }
            .navigationTitle("Profile")
            .toolbar(content: {
                ToolbarItem(placement: .topBarLeading){
                    Button("Sign out", role: .destructive) {
                        Task {
//                            try? await supabase.auth.signOut()
                        }
                    }
                }
            })
        }
        .task {
            await viewModel.getProfile()
        }
    }
}

#Preview {
    ProfileView()
}
