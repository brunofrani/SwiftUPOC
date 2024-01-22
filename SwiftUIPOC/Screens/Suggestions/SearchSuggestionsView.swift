//
//  SearchSuggestionsView.swift
//  WhereToPOC
//
//  Created by Bruno Frani on 20.1.24.
//

import SwiftUI

struct SearchSuggestionsView: View {
    var suggestions: [SuggestionModel]

    private let adaptiveRow = [
        GridItem(.adaptive(minimum: 50))
    ]
    var body: some View {
        HStack(alignment: .center, spacing: 10) {
            Button {
            } label: {
                Image("4")
                    .resizable()
                    .tint(.black)
                    .frame(width: 25, height: 25)
                    .padding(2)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(.black, lineWidth: 1)
                    )

            }
            ScrollView([.horizontal], showsIndicators: false) {
                LazyHGrid(rows: adaptiveRow, content: {
                    ForEach(suggestions, id: \.self) { suggestion in

                        Text(suggestion.name + " " + String(suggestion.count))
                            .padding(EdgeInsets(top: 5, leading: 10, bottom: 5, trailing: 10))
                            .background(AppColors.lightBackground)
                            .cornerRadius(10)

                    }

                })
            }

            .frame(height: 40)
        }

    }
}

#Preview {
    SearchSuggestionsView(suggestions: [SuggestionModel(id: UUID(), name: "Rome", count: 30), SuggestionModel(id: UUID(), name: "Frankfurt", count: 20), SuggestionModel(id: UUID(), name: "rome", count: 30), SuggestionModel(id: UUID(), name: "Frankfurt", count: 20), SuggestionModel(id: UUID(), name: "rome", count: 30), SuggestionModel(id: UUID(), name: "Frankfurt", count: 20), SuggestionModel(id: UUID(), name: "rome", count: 30), SuggestionModel(id: UUID(), name: "Frankfurt", count: 20), SuggestionModel(id: UUID(), name: "rome", count: 30), SuggestionModel(id: UUID(), name: "Frankfurt", count: 20), SuggestionModel(id: UUID(), name: "rome", count: 30), SuggestionModel(id: UUID(), name: "Frankfurt", count: 20), SuggestionModel(id: UUID(), name: "rome", count: 30), SuggestionModel(id: UUID(), name: "Frankfurt", count: 20), SuggestionModel(id: UUID(), name: "rome", count: 30), SuggestionModel(id: UUID(), name: "Frankfurt", count: 20), SuggestionModel(id: UUID(), name: "rome", count: 30), SuggestionModel(id: UUID(), name: "Frankfurt", count: 20), SuggestionModel(id: UUID(), name: "rome", count: 30), SuggestionModel(id: UUID(), name: "Frankfurt", count: 20), SuggestionModel(id: UUID(), name: "rome", count: 30), SuggestionModel(id: UUID(), name: "Frankfurt", count: 20)])
}
