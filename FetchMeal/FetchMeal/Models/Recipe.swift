//
//  Recipe.swift
//  FetchMeal
//
//  Created by Paul Walker on 12/19/24.
//

import Foundation

struct Recipes:Codable{
    var recipes:[Recipe]
}

struct SectionRecipe{
    var section:String
    var recipes:[Recipe]
}

struct Recipe:Codable,Comparable{
    var uuid: UUID
    var name: String
    var cuisine:String
    var photo_url_large:URL
    var photo_url_small:URL
    var source_url:String?
    var youtube_url:String?
    
    enum codingKeys:String,CodingKey{
        case cuisine = "cuisine"
        case name = "name"
        case photo_url_large = "photo_url_large"
        case photo_url_small = "photo_url_small"
        case uuid = "uuid"
        case source_url = "source_url"
        case youtube_url = "youtube_url"
    }
    
    static func <(lhs: Recipe, rhs: Recipe) -> Bool {
        return lhs.name < rhs.name
    }
}
