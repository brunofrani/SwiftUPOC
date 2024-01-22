//
//  SecondTabView.swift
//  WhereToPOC
//
//  Created by Bruno Frani on 19.1.24.
//

import SwiftUI

struct SearchTabView: View {
    @StateObject private var viewModel = SearchViewModel()
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
                        Text("fetching")
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
                        currentTab = .profile
                        print("Dragged from left to right")
                    } else if dragOffset < 0 {

                        print("Dragged from right to left")
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
    SearchTabView(currentTab: .constant(.search))
}
