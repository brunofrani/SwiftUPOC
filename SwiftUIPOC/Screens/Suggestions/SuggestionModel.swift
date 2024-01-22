//
//  SuggestionModel.swift
//  WhereToPOC
//
//  Created by Bruno Frani on 20.1.24.
//

import Foundation

struct SuggestionModel: Hashable {
    let id: UUID
    let name: String
    let count: Int
}
