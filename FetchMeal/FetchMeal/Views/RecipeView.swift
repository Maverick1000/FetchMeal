//
//  RecipeView.swift
//  FetchMeal
//
//  Created by Paul Walker on 12/19/24.
//

import SwiftUI

struct RecipeView: View {
    var categoryName: String
    
    @StateObject var recipeViewModel: RecipeViewModel
    
    init(categoryName: String = "cuisine") {
        self.categoryName = categoryName
        self._recipeViewModel = StateObject(wrappedValue: RecipeViewModel(categoryName: categoryName) )
    }
    
    var body: some View {
        NavigationStack{
            //List(recipeViewModel.sectionRecipe,id:\.section){ section in
            //Text(section.section)
            if recipeViewModel.recipes.count == 0{
                Text("test")
            }else{
                List(recipeViewModel.recipes, id:\.uuid ) { recipe in
                    HStack(alignment: .top){
                        RecipeListView(recipeItem: recipe)
                    }
                    .navigationTitle(categoryName)
                }
                .task {
                    await recipeViewModel.fetchRecipes()
                }
            }
        }
        
    }
}

#Preview {
    RecipeView(categoryName: "Cuisine")
}
