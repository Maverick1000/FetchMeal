//
//  RecipeView.swift
//  FetchMeal
//
//  Created by Paul Walker on 12/19/24.
//

import SwiftUI

struct RecipeView: View {
    var listHeaderName: String
    
    @StateObject var recipeViewModel: RecipeViewModel
    
    init(listHeaderName: String = "Cuisine") {
        self.listHeaderName = listHeaderName
        self._recipeViewModel = StateObject(wrappedValue: RecipeViewModel())
    }
    
    var body: some View {
        NavigationStack{
            //List(recipeViewModel.sectionRecipe,id:\.section){ section in
            //Text(section.section)
            if recipeViewModel.recipes.count == 0{
                NoDataView()
            }else{
                List(recipeViewModel.recipes, id:\.uuid ) { recipe in
                    HStack(alignment: .top){
                        RecipeListView(recipeItem: recipe)
                    }
                    .navigationTitle(listHeaderName)
                }
            }
        }
        .task {
            await recipeViewModel.fetchRecipes()
        }
        .refreshable {
            await recipeViewModel.fetchRecipes()
        }
    }
}

#Preview {
    RecipeView(listHeaderName: "Cuisine")
}
