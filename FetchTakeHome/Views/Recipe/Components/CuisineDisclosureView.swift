//
//  CuisineDisclosureView.swift
//  FetchTakeHome
//
//  Created by Chris Rowley on 5/6/25.
//

import Foundation
import SwiftUI


struct CuisineDisclosureView: View {
    let key: String
    @Binding var expandedCuisines: Set<String>
    @ObservedObject var viewModel: RecipeViewModel
    var body: some View {
        DisclosureGroup(
            isExpanded: Binding(
                get: { expandedCuisines.contains(key) },
                set: { isExpanded in
                    if isExpanded {
                        expandedCuisines.insert(key)
                    } else {
                        expandedCuisines.remove(key)
                    }
                }
            ),
            content: {
                if let value = viewModel.cuisineMap[key] {
                    ForEach(value, id: \.name) { recipe in
                        NavigationLink(destination: EmptyView()) {
                            HStack{
                                VStack {
                                    Text(recipe.name ?? "")
                                        .font(.headline)
                                        .fontWeight(.regular)
                                        .multilineTextAlignment(.leading)
                                        .padding(.bottom, 10)
                                        .padding(.trailing, 10)
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                    
                                }
                                Spacer()
                                if let photo = recipe.photo_url_small {
                                    AsyncImage(url: URL(string:photo)) { image in
                                        image.resizable()
                                    }  placeholder: {
                                        RoundedRectangle(cornerRadius: 8).fill(Color.gray)
                                            .overlay(
                                                Image(systemName: "camera")
                                            )
                                    }
                                    .frame(width: 50, height: 50)
                                    .clipShape(RoundedRectangle(cornerRadius:8))
                                }
                            }
                        }
                    }
                }
            },
            label: {
                HStack {
                    Image(systemName: "fork.knife") // or any symbol
                        .foregroundColor(.blue)
                    Text(key)
                        .font(.headline)
                        .foregroundColor(.primary)
                }
                .padding(.vertical, 8)
                .contentShape(Rectangle()) // better tap hitbox
            }
        )
    }
}
