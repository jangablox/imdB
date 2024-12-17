//
//  YoutubeSearchResponse.swift
//  Ela's App
//
//  Created by Kaushal Janga on 7/19/24.
//

import Foundation

struct YoutubeResponse: Codable {
    let items: [VideoElement]
}


struct VideoElement: Codable {
    let id: IdVideoElement
}


struct IdVideoElement: Codable {
    let kind: String
    let videoId: String
}
