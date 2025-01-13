//
//  UserProfile.swift
//  iakadir_app
//
//  Created by Ugo Wadoux on 30/12/2024.
//

import Foundation

class UserProfile: Codable {
    static var shared: UserProfile? // Singleton for the current user
    
    // User-specific properties
    let id: UUID?
    let email: String?
    var firstName: String?
    var lastName: String?
    let is_pro: Bool?
    var avatarURL: URL?
    
    // Initializer
    init(id: UUID? = nil, email: String? = nil , firstName: String? = nil, lastName: String? = nil, avatarURL: URL? = nil, is_pro: Bool? = nil) {
        self.id = id
        self.email = email
        self.firstName = firstName
        self.lastName = lastName
        self.avatarURL = avatarURL
        self.is_pro = is_pro
    }
    
    // Convenience property for full name
    var fullName: String {
        return "\(firstName ?? "") \(lastName ?? "")".trimmingCharacters(in: .whitespaces)
    }
        
    // Clear user (logout)
    static func logout() {
        shared = nil
    }
}
