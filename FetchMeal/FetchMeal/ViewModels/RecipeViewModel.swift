//
//  RecipeViewModel.swift
//  FetchMeal
//
//  Created by Paul Walker on 12/19/24.
//


import Foundation

extension RecipeView{
    @MainActor class RecipeViewModel:ObservableObject {
        var networkManager = NetworkManager()
        private var categoryName: String = "Recipes"
        
        @Published var recipes: [Recipe] = [Recipe]()
        
        private var url: URL? {
            return URL(string:"https://d3jbb8n5wk0qxi.cloudfront.net/recipes.json")
        }
        
        init(categoryName: String) {
            self.categoryName = categoryName
        }
        
        func fetchRecipes() async {
            guard let url = url else { return }
            let downloaded:Recipes? = await networkManager.fetch(type: Recipes.self, from: url)
            if let downloaded = downloaded {
                recipes = downloaded.recipes.sorted()
            }
       }
    }
}
