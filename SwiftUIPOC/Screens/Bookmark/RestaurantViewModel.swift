//
//  RestaurantViewModel.swift
//  WhereToPOC
//
//  Created by Bruno Frani on 20.1.24.
//

import SwiftUI

class BookmarkViewModel: ObservableObject {
    @Published var items: [RestaurantModel] = []
    @Published var isLoading = false
    private var page = 1

    func loadData() {
        ApiService.fetchRestaurants(page: page) { newData in
            self.items.append(contentsOf: newData)
            self.isLoading = false
        }
    }

    func loadMoreDataIfNeeded(restarurant: RestaurantModel) {
        if items.last == restarurant && page < 6 {
            isLoading = true
            page += 1
            loadData()
        }
    }

}
