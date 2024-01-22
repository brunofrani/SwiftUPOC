//
//  RestaurantModel.swift
//  WhereToPOC
//
//  Created by Bruno Frani on 19.1.24.
//

import Foundation

struct RestaurantModel: Hashable {
    var id: UUID
    var name: String
    var city: String
    var backgroundImageName: String
    var badgeImageName: String
}
