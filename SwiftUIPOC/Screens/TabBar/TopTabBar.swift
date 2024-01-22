//
//  BottomTabBar.swift
//  WhereToPOC
//
//  Created by Bruno Frani on 19.1.24.
//

import SwiftUI

struct TopTabBar: View {

    @Binding var currentTab: TabItem
    @Namespace var namespace

    var body: some View {

        HStack(spacing: 0) {
                 TabBarItemView(currentTab: $currentTab, namespace: namespace.self, tabBarItemName: "globe", tab: TabItem.profile.rawValue)
                 TabBarItemView(currentTab: $currentTab, namespace: namespace.self, tabBarItemName: "bookmark", tab: TabItem.search.rawValue)
            }

    }
}

#Preview {
    TopTabBar(currentTab: .constant(.profile))
}
