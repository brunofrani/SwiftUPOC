//
//  TabBarItemView.swift
//  WhereToPOC
//
//  Created by Bruno Frani on 19.1.24.
//

import SwiftUI

struct TabBarItemView: View {

    @Binding var currentTab: TabItem
    let namespace: Namespace.ID
    var tabBarItemName: String
    var tab: Int

    var body: some View {
        VStack {

            if currentTab.rawValue == tab {
                Image(tabBarItemName)
                    .resizable()
                    .renderingMode(.template)
                    .frame(width: 20, height: 20)
                    .foregroundColor(AppColors.invertedColor)
                Rectangle()
                    .frame(height: 3)
                    .foregroundColor(AppColors.invertedColor)
                    .matchedGeometryEffect(id: "underline",
                                           in: namespace,
                                           properties: .frame)
            } else {
                Image(tabBarItemName)
                    .resizable()
                    .renderingMode(.template)
                    .frame(width: 20, height: 20)
                    .foregroundColor(AppColors.invertedColor.opacity(0.4))
                Rectangle()
                    .frame(height: 3)
                    .foregroundColor(.clear)
            }
        }
//        .padding()
        .background(AppColors.straightColor)
        .onTapGesture {
            currentTab = TabItem(rawValue: tab )!
        }
        .animation(.spring(), value: self.currentTab)
    }
}

#Preview {
    TabBarItemView(currentTab: .constant(.search), namespace: Namespace().wrappedValue, tabBarItemName: "globe", tab: 2)
}
