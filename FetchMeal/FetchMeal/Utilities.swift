//
//  Untitled.swift
//  FetchMeal
//
//  Created by Paul Walker on 12/19/24.
//
import SwiftUI
import Foundation

struct Utilities {
    /// Dimension for the thumbnail images.
    static let thumbnailSize: CGFloat = 50
    
    static public func sectionSort(items: [Recipe]) ->[SectionRecipe]{
        var tempKeyValuePair = [SectionRecipe]()
        
        for item in items{
            let temp = getAllCuisine(cuisine: item.cuisine, recipe:items)
            
            if !tempKeyValuePair.contains(where: { section in
                section.section == item.cuisine
            }){
                tempKeyValuePair.append(
                    SectionRecipe(section: item.cuisine, recipes: temp))
            }
        }
        return tempKeyValuePair
    }
    
    static func getAllCuisine(cuisine:String, recipe:[Recipe]) ->[Recipe]{
        var temp  = [Recipe]()
        
        for item in recipe {
            if item.cuisine == cuisine{
                temp.append(item)
            }
        }
        return temp
    }
    
    static let recipe = Recipe(uuid: UUID(), name: "American", cuisine: "American", photo_url_large: URL(filePath: "https://d3jbb8n5wk0qxi.cloudfront.net/photos/b9ab0071-b281-4bee-b361-ec340d405320/small.jpg")!, photo_url_small: URL(filePath: "https://d3jbb8n5wk0qxi.cloudfront.net/photos/b9ab0071-b281-4bee-b361-ec340d405320/small.jpg")!,
                               source_url:nil, youtube_url: nil)
}
