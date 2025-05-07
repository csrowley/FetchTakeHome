//
//  FetchTakeHomeApp.swift
//  FetchTakeHome
//
//  Created by Chris Rowley on 5/6/25.
//

import SwiftUI
import SwiftData

@main
struct FetchTakeHomeApp: App {
    @StateObject var recipeViewModel: RecipeViewModel = RecipeViewModel()
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            Item.self,
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(recipeViewModel)
        }
        .modelContainer(sharedModelContainer)
    }
}
