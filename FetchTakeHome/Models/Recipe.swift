////
////  Recipe.swift
////  FetchTakeHome
////
////  Created by Chris Rowley on 5/6/25.
////
//
import Foundation

struct RecipeResponse: Codable {
    var recipes = [Recipe]()
}

struct Recipe: Codable, Hashable {
    let cuisine: String?
    let name: String?
    let photo_url_large: String?
    let photo_url_small: String?
    let source_url: String?
    private let uuidString: String?
    let youtube_url: String?
    
    var uuid: UUID? {
        UUID(uuidString: uuidString ?? "")
    }
    
    enum CodingKeys: String, CodingKey {
        case cuisine
        case name
        case photo_url_large
        case photo_url_small
        case source_url
        case youtube_url
        
        case uuidString = "uuid"
    }
    
}
