//
//  RecipeView.swift
//  FetchTakeHome
//
//  Created by Chris Rowley on 5/6/25.
//

import SwiftUI

struct RecipeView: View {
    @EnvironmentObject var viewModel: RecipeViewModel
    @State private var expandedCuisines: Set<String> = []
    
    var body: some View {
        ZStack {
            Color.offWhite.ignoresSafeArea(.all)
            NavigationStack {
                ScrollView {
                    VStack {
                        ForEach(Array(viewModel.cuisineMap.keys.sorted {$0 < $1}), id: \.self){ key in
                            CuisineDisclosureView(key: key, expandedCuisines: $expandedCuisines, viewModel: viewModel)
                            .tint(Color.black)
                            Divider()
                                .opacity(0.7)
                        }
                    }
                    .padding(.horizontal)
                    .onAppear {
                        Task {
                            await viewModel.fetchRecipes()
                        }
                        
                        viewModel.mapRecipesByCuisine()
                    }
                }
                .navigationTitle(Text("Recipes"))
            }
        }
    }
}

#Preview {
    RecipeView()
        .environmentObject(RecipeViewModel())
}
