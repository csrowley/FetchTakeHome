import Foundation
import SwiftUI

class RecipeViewModel: ObservableObject {
    @Published var recipes: [Recipe] = []
    @Published var cuisineMap: [String: [Recipe]] = [:]
    
    func fetchRecipes() async {
        guard let url = URL(string: "https://d3jbb8n5wk0qxi.cloudfront.net/recipes.json") else {
            print("Invalid URL")
            return
        }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            
            if let decodedData = try? JSONDecoder().decode(RecipeResponse.self, from: data) {
                recipes = decodedData.recipes
            } else {
                print("Unable to decode JSON")
            }
        } catch {
            print("Unable to fetch data: \(error.localizedDescription)")
        }
        
        mapRecipesByCuisine()
        
    }
    
    func mapRecipesByCuisine() {
        cuisineMap = Dictionary(grouping: recipes) { recipe in
            recipe.cuisine ?? ""
        }
        print(cuisineMap)
    }
}
