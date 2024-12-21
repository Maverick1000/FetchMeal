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
      
        
        @Published var recipes: [Recipe] = [Recipe]()
        @Published var sectionRecipe : [SectionRecipe] = [SectionRecipe]()
    
        private var url: URL? {
            return URL(string:"https://d3jbb8n5wk0qxi.cloudfront.net/recipes.json")
            //Malformed Data:
            //return URL(string:"https://d3jbb8n5wk0qxi.cloudfront.net/recipes-malformed.json")
            //Empty Data:
            //return URL(string:"https://d3jbb8n5wk0qxi.cloudfront.net/recipes-empty.json")
        }
        
        func fetchRecipes() async {
            guard let url = url else { return }
            let downloaded:Recipes? = await networkManager.fetch(type: Recipes.self, from: url)
            if let downloaded = downloaded {
                recipes = downloaded.recipes.sorted()
                sectionRecipe = Utilities.sectionSort(items: downloaded.recipes)
            }
       }
    }
}
