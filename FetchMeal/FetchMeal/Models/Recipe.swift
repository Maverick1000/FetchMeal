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



//"cuisine": "French",
//            "name": "White Chocolate Crème Brûlée",
//            "photo_url_large": "https://d3jbb8n5wk0qxi.cloudfront.net/photos/f4b7b7d7-9671-410e-bf81-39a007ede535/large.jpg",
//            "photo_url_small": "https://d3jbb8n5wk0qxi.cloudfront.net/photos/f4b7b7d7-9671-410e-bf81-39a007ede535/small.jpg",
//            "source_url": "https://www.bbcgoodfood.com/recipes/2540/white-chocolate-crme-brle",
//            "uuid": "ef7d81b7-07ba-4fab-a791-ae10e2817e66",
//            "youtube_url": "https://www.youtube.com/watch?v=LmJ0lsPLHDc"
