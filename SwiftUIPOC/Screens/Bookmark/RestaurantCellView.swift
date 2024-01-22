//
//  RestaurantCellView.swift
//  WhereToPOC
//
//  Created by Bruno Frani on 19.1.24.
//

import SwiftUI

struct RestaurantCellView: View {

    var restaurant: RestaurantModel
    var body: some View {

            VStack {

                Image(restaurant.backgroundImageName)
                    .resizable(resizingMode: .stretch)
                    .frame(height: 170)

                HStack {
                    VStack(alignment: .leading) {
                        Text(restaurant.name)
                            .font(Font.system(size: 16, weight: .semibold))
                        Text(restaurant.city)
                            .foregroundStyle(.orange)

                    }
                    Spacer()
                    Image(restaurant.badgeImageName)
                        .resizable()
                        .frame(width: 30, height: 30)
                        .padding(5)
                        .overlay(
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(AppColors.lightBackground, lineWidth: 1)
                        )
                }
            }
            .overlay(
                Rectangle()
                    .stroke(AppColors.lightBackground, lineWidth: 1)
            )

    }
}

#Preview {
    RestaurantCellView(restaurant: RestaurantModel(id: UUID(), name: "toto", city: "frankfurt", backgroundImageName: "4", badgeImageName: "3" ))
}
