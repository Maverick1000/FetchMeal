//
//  Untitled.swift
//  FetchMeal
//
//  Created by Paul Walker on 12/19/24.
//
import SwiftUI

struct RecipeListView : View{
    var recipeItem:Recipe
    
    var body: some View {
        HStack(alignment:.top){
            AsyncImage(url: recipeItem.photo_url_small ) { imagePhase in
                if let image = imagePhase.image {
                    image
                        .resizable()
                        .scaledToFit()
                        .frame(width: Utilities.thumbnailSize, height: Utilities.thumbnailSize)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                } else if imagePhase.error != nil {
                    Image(systemName: "fork.knife")
                        .frame(width: Utilities.thumbnailSize, height: Utilities.thumbnailSize)
                } else {
                    ProgressView()
                }
            }
            VStack(alignment: .leading){
                Text(recipeItem.cuisine)
                    .font(.title).italic()
                Text(recipeItem.name)
                    .font(.body).italic()  //.background(Color.blue)
            }
        }
    }
}

#Preview {
    RecipeListView(recipeItem: Utilities.recipe)
}
