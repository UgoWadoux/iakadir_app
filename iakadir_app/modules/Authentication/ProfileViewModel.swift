//
//  ProfileViewModel.swift
//  iakadir_app
//
//  Created by Ugo Wadoux on 13/12/2024.
//

import Foundation
import Supabase

class ProfileViewModel: ObservableObject {
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var firstName: String = ""
    @Published var lastName: String = ""
    @Published var profile: Profile?
    
    private let authService: AuthService
    
    init(authService: AuthService = AuthService()) {
        self.authService = authService
    }
    
    @MainActor
    public func getProfile() async {
        self.profile = await authService.getProfileFromCurrentUser()
        print(profile ?? "")
        self.email = self.profile?.email ?? ""
        self.password = self.profile?.email ?? ""
        self.lastName = self.profile?.last_name ?? ""
        self.firstName = self.profile?.first_name ?? ""
    }
    
}
