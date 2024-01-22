//
//  MainTabViewModel.swift
//  WhereToPOC
//
//  Created by Bruno Frani on 20.1.24.
//

import SwiftUI

class MainTabViewModel: ObservableObject {
    var userAccountDetails = AccountModel(
        username: "bruno_frani99",
        profileImge: "1",
        displayName: "Bruno Frani",
        role: "Enthusiast",
        roleImage: "2",
        description: "Hello my name is Bruno and i love to travel and visit the best restaurants in each city.",
        followers: 140,
        visits: 140,
        following: 140
    )

    @Published var suggestions: [SuggestionModel] = [
        SuggestionModel(id: UUID(), name: "Rome", count: 30),
        SuggestionModel(id: UUID(), name: "Frankfurt", count: 20),
        SuggestionModel(id: UUID(), name: "Bohn", count: 30),
        SuggestionModel(id: UUID(), name: "Paris", count: 20),
        SuggestionModel(id: UUID(), name: "Stockholm", count: 30),
        SuggestionModel(id: UUID(), name: "Tirana", count: 20),
        SuggestionModel(id: UUID(), name: "Skopje", count: 30),
        SuggestionModel(id: UUID(), name: "Munchen", count: 20)
    ]
}
