//
//  ContentView.swift
//  FetchTakeHome
//
//  Created by Chris Rowley on 5/6/25.
//

import SwiftUI
import SwiftData

// Recipe Json: https://d3jbb8n5wk0qxi.cloudfront.net/recipes.json

struct ContentView: View {
    @State private var selectedTab: Int? = 0
    var body: some View {
        ZStack{
            TabView {
                RecipeView()
                    .navigationTitle("Recipes")
                    .tabItem {
                        Image(systemName: "fork.knife")
                        Text("Recipes")
                    }
                    .tag(0)
                
                Text("Saved Recipes")
                    .tabItem {
                        Image(systemName: "bookmark")
                        Text("Saved")
                    }
                    .tag(1)
            }

        }
    }
}

#Preview {
    ContentView()
        .environmentObject(RecipeViewModel())
        .modelContainer(for: Item.self, inMemory: true)
}
