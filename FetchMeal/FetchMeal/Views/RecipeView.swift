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
    
    init(categoryName: String = "Dessert") {
        self.categoryName = categoryName
        self._recipeViewModel = StateObject(wrappedValue: RecipeViewModel(categoryName: categoryName) )
    }
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
        .task {
            await recipeViewModel.fetchRecipes()
        }
    }
    
    
}

#Preview {
    RecipeView(categoryName: "test")
}
