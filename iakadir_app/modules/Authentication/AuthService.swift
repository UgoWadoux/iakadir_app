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
    let supabase = SupabaseManager.self
    let client: SupabaseClient = SupabaseManager.shared.client
    @Published var errorMessage: AuthError?
    
    
    public func register(email: String, password: String, first_name:String, last_name:String) async -> AuthError?{
        do {
            print (email, password)
            try await client.auth.signUp(
                email: email,
                password: password,
                data: [
                    "first_name": .string(first_name),
                    "last_name": .string(last_name)
                ]
            )
            errorMessage = nil
            return nil
        } catch {
            // Log and propagate error
            print(error)
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
    
    
    public func getProfileFromCurrentUser() async -> Profile? {
        do {
            let currentUser = try await client.auth.session.user
            let profile : Profile = try await client
                .from("profiles")
                .select()
                .eq("id", value: currentUser.id)
                .single()
                .execute()
                .value
            return profile
        } catch {
            return nil
        }
    }
}

