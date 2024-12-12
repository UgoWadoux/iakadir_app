//
//  AuthService.swift
//  iakadir_app
//
//  Created by Ugo Wadoux on 11/12/2024.
//
import Foundation
import Supabase

class AuthService: ObservableObject{
    enum AuthError: Error {
        case invalidEmail
        case invalidPassword
        case invalidConfirmPassword
        case invalidUsername
        case supaBaseError(message: String)
        
        var message: String {
            switch self {
            case .invalidEmail:
                return "Invalid email"
            case .invalidPassword:
                return "Invalid password"
            case .invalidConfirmPassword:
                return "Invalid confirm password"
            case .invalidUsername:
                return "Invalid username"
            case .supaBaseError(let message):
                return message
            }
        }
    }
    let client: SupabaseClient = SupabaseManager.shared.client
    @Published var errorMessage: AuthError?
    
    
    public func register(email: String, password: String) async -> AuthError?{
        do {
            print (email, password)
            try await client.auth.signUp(
                email: email,
                password: password,
                data: [
                    "first_name": .string("test")
                ]
            )
            errorMessage = nil
            return nil
        } catch {
            // Log and propagate error
            errorMessage = AuthError.supaBaseError(message: error.localizedDescription)
            return errorMessage
            
        }
    }
    
    public func login(email: String, password: String) async -> AuthError? {
        do {
            try await client.auth.signIn(
                email: email,
                password: password
            )
            errorMessage = nil
            return nil
        } catch {
            errorMessage = AuthError.supaBaseError(message: error.localizedDescription)
            return errorMessage
        }
    }
}
