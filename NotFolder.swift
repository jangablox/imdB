//
//  NotFolder.swift
//  Ela's App
//
//  Created by Kaushal Janga on 7/4/24.
//

import Foundation

struct APIResponse: Codable {
    let results: [NotFolder]
}

struct NotFolder : Codable {
    let id: Int
    let name: String?
    let poster_path: String?
    let original_name: String?
    let title: String?
    let profile_path: String?
    let origional_title: String?
    let media_type: String
    let release_date: String?
    let overview: String?
    let vote_average: Float?
}
