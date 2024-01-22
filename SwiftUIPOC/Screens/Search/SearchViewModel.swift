//
//  SearchViewModel.swift
//  WhereToPOC
//
//  Created by Bruno Frani on 19.1.24.
//

import Foundation

class SearchViewModel: ObservableObject {
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
