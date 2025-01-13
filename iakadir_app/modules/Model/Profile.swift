//
//  Profile.swift
//  iakadir_app
//
//  Created by Ugo Wadoux on 13/12/2024.
//

import Foundation


struct Profile: Codable {
    let id : UUID?
    let first_name: String?
    let last_name: String?
    let email: String?
    let is_pro: Bool?
    
    
    enum CodingKeys: String, CodingKey {
        case id
        case first_name
        case last_name
        case email
        case is_pro
    }
}
