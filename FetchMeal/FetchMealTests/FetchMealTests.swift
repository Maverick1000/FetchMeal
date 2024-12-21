//
//  FetchMealTests.swift
//  FetchMealTests
//
//  Created by Paul Walker on 12/19/24.
//

import Testing
import SwiftUI
@testable import FetchMeal

enum url:String {
    case all = "https://d3jbb8n5wk0qxi.cloudfront.net/recipes.json"
    case Malformed = "https://d3jbb8n5wk0qxi.cloudfront.net/recipes-malformed.json"
    case Empty =  "https://d3jbb8n5wk0qxi.cloudfront.net/recipes-empty.json"
}

struct FetchMealTests {
    @Test func getAllRecipes() async throws {
        // Write your test here and use APIs like `#expect(...)` to check expected conditions.
        let network = NetworkManager()
        if let test = await network.fetch(type:Recipes.self , from: URL(string: url.all.rawValue)!){
            #expect(test.recipes.count > 0)
        }
    }
    @Test func checkForMalformedJSON() async throws {
        // Write your test here and use APIs like `#expect(...)` to check expected conditions.
        let network = NetworkManager()
        if let test = await network.fetch(type:Recipes.self , from: URL(string: url.Malformed.rawValue)!){
            #expect(test.recipes.count  == 0)
        }
    }
    @Test func checkForEmptyJSON() async throws {
        // Write your test here and use APIs like `#expect(...)` to check expected conditions.
        let network = NetworkManager()
        if let test = await network.fetch(type:Recipes.self , from: URL(string: url.Empty.rawValue)!){
            #expect(test.recipes.count == 0)
        }
    }
}
