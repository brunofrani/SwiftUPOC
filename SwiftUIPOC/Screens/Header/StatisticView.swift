//
//  StatisticView.swift
//  WhereToPOC
//
//  Created by Bruno Frani on 20.1.24.
//

import SwiftUI

struct StatisticView: View {
    var count: Int
    var description: String
    var body: some View {
        VStack(spacing: 5) {
            Text(String(count))
                .font(Font.system(size: 20, weight: .semibold))
            Text(description)
                .font(Font.system(size: 14))
                .foregroundStyle(Color.gray)

        }
    }
}

#Preview {
    StatisticView(count: 140, description: AppStrings.followers)
}
