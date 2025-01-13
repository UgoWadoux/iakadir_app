//
//  LoginModelView.swift
//  iakadir_app
//
//  Created by Ugo Wadoux on 12/12/2024.
//
import Foundation

class LoginViewModel : ObservableObject {
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var errorMessage: String?
    @Published var isSuccess: Bool = false
    
    private let authService: AuthService
    
    init(authService: AuthService = AuthService()) {
        self.authService = authService
    }
    @MainActor
    public func login() async{
        guard !email.isEmpty else {
            errorMessage = "Please enter an email"
            return
        }
        
        guard !password.isEmpty else {
            errorMessage = "Please enter a password"
            return
        }
        let error = await authService.login(email: email, password: password)
        if error != nil {
            errorMessage = error?.message
        } else {
            isSuccess = true
        }
        
    }
}
