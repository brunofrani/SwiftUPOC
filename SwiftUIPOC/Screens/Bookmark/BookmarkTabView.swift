//
//  FirstTabView.swift
//  WhereToPOC
//
//  Created by Bruno Frani on 19.1.24.
//

import SwiftUI

struct BookmarkTabView: View {

    @StateObject private var viewModel = BookmarkViewModel()
    @Binding var currentTab: TabItem
    @State private var dragOffset: CGFloat = 0

    private let adaptiveColumn = [
        GridItem(.adaptive(minimum: 150))
    ]
    var body: some View {
        ZStack {
            ScrollView {
                LazyVGrid(columns: adaptiveColumn, spacing: 5) {
                    ForEach(viewModel.items, id: \.self) { restaurant in

                        RestaurantCellView(restaurant: restaurant)

                            .task {
                                viewModel.loadMoreDataIfNeeded(restarurant: restaurant)
                            }
                    }
                }

                if viewModel.isLoading {
                    ProgressView {
                        Text(AppStrings.fetching)
                            .foregroundColor(.red)
                    }
                    .tint(.red)
                }
            }
        }
        .gesture(
            DragGesture()
                .onChanged { value in
                    dragOffset = value.translation.width
                }
                .onEnded { _ in
                    if dragOffset > 0 {

                        print("Dragged from left to right")
                    } else if dragOffset < 0 {
                        print("Dragged from right to left")
                        currentTab = .search
                    }
                    dragOffset = 0
                }
        )
        .onAppear {
            viewModel.loadData()
        }
    }
}

#Preview {
    BookmarkTabView(currentTab: .constant(.profile))
}
