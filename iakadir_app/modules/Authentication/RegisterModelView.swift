//
//  RegisterModelView.swift
//  iakadir_app
//
//  Created by Ugo Wadoux on 11/12/2024.
//
import Foundation


class RegisterModelView: ObservableObject {
    @Published var email: String = ""
    @Published var password: String = ""
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
        
        let error = await authService.register(email: email, password: password)
        if error != nil {
            errorMessage = error?.message
        } else {
            isSuccess = true
        }

    }
}
