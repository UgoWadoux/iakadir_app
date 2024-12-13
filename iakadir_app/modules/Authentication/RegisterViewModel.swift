//
//  RegisterModelView.swift
//  iakadir_app
//
//  Created by Ugo Wadoux on 11/12/2024.
//
import Foundation


class RegisterViewModel: ObservableObject {
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var first_name: String = ""
    @Published var last_name: String = ""
    @Published var confirmPassword: String = ""
    @Published var errorMessage: String?
    @Published var isSuccess: Bool = false
    
    private let authService: AuthService
    
    init(authService: AuthService = AuthService()) {
        self.authService = authService
    }
    
    @MainActor
    func register() async {
        
        guard !email.isEmpty else {
            errorMessage = "Please enter an email"
            return
        }
        
        guard !password.isEmpty else {
            errorMessage = "Please enter a password"
            return
        }
        
        guard !confirmPassword.isEmpty else {
            errorMessage = "Please confirm your password"
            return
        }
        guard password == confirmPassword else {
            errorMessage = "Passwords do not match"
            return
        }
        guard !first_name.isEmpty else {
            errorMessage = "Please enter your first name"
            return
        }
        guard !last_name.isEmpty else {
            errorMessage = "Please enter your last name"
            return
        }
        
        let error = await authService.register(email: email, password: password, first_name: first_name, last_name: last_name)
        if error != nil {
            errorMessage = error?.message
        } else {
            isSuccess = true
        }

    }
}
