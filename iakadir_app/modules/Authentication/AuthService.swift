//
//  AuthService.swift
//  iakadir_app
//
//  Created by Ugo Wadoux on 11/12/2024.
//
import Foundation
import Supabase

class AuthService{
    
    let client: SupabaseClient = SupabaseManager.shared.client
    @Published var errorMessage: String?
    
    public func register(email: String, password: String) async{
        do {
            print (email, password)
            try await client.auth.signUp(
                email: email,
                password: password,
                data: [
                    "first_name": .string("test")
                ]
            )
        } catch {
            // Log and propagate error
            errorMessage = "Failed to register: \(error.localizedDescription)"
            throw error
        }
        
    }
}
