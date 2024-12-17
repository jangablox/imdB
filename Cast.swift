//
//  Cast.swift
//  Ela's App
//
//  Created by Kaushal Janga on 7/17/24.
//

import Foundation

struct CastResponse: Codable {
    let cast: [Cast]
}

struct Cast : Codable {
    let id: Int
    let name: String?
    let original_name: String?
    let profile_path: String?
    let character: String?
    let original_title: String?
    let poster_path: String?
    let media_type: String
    
}
