//
//  MainTabView.swift
//  WhereToPOC
//
//  Created by Bruno Frani on 19.1.24.
//

import SwiftUI

struct MainTabView: View {

    @State private var currentTab: TabItem = .profile
    @StateObject private var viewModel: MainTabViewModel = MainTabViewModel()
    var body: some View {
        GeometryReader { _ in
            ScrollView(showsIndicators: false) {
                LazyVStack(alignment: .leading, spacing: 10, pinnedViews: [.sectionHeaders]) {
                    Section {
                        VStack {
                            HeaderView(account: viewModel.userAccountDetails)
                            SearchSuggestionsView(suggestions: viewModel.suggestions)}

                    } header: {
                    }
                    
                    Section {

                        if currentTab == .profile {

                            BookmarkTabView(currentTab: $currentTab)
                        } else if currentTab == .search {

                            SearchTabView(currentTab: $currentTab)
                        }

                    } header: {
                        TopTabBar(currentTab: $currentTab)
                    }
                }
            }

        }
        .safeAreaInset(edge: .top, alignment: .center, spacing: 0) {
            AppColors.straightColor
                .frame(height: 1)
                .background(.clear)
        }
        .padding(10)
    }
}

#Preview {
    MainTabView()
}
