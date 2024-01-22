//
//  ApiService.swift
//  WhereToPOC
//
//  Created by Bruno Frani on 20.1.24.
//

import Foundation

class ApiService {
    static func fetchRestaurants(page: Int, completion: @escaping ([RestaurantModel]) -> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {

            let newData = generateRandomRestaurantModels(count: 15)
            completion(newData)
        }
    }
}

// MARK: Generate mock restaurants
extension ApiService {

    static func generateRandomRestaurantModels(count: Int) -> [RestaurantModel] {
        var models: [RestaurantModel] = []

        for _ in 1...count {
            let randomId = UUID()
            let randomName = getRandomRestaurantName()
            let randomCity = getRandomCityName()
            let randomBackgroundImage = getRandomBackgroundImage()
            let randomBadgeImage = getRandomBadgeImage()

            let restaurantModel = RestaurantModel(id: randomId, name: randomName, city: randomCity, backgroundImageName: randomBackgroundImage, badgeImageName: randomBadgeImage)
            models.append(restaurantModel)
        }

        return models
    }

    private static func getRandomCityName() -> String {
        let cityNames = ["Tirana", "Paris", "New York", "Tokyo", "London"]
        return cityNames.randomElement() ?? "Unknown City"
    }

    private static func getRandomRestaurantName() -> String {
        let restaurantNames = ["LeBon", "Chez Maman", "La Trattoria", "The Brasserie", "Sushi Palace"]
        return restaurantNames.randomElement() ?? "Unknown Restaurant"
    }

    private static func getRandomBackgroundImage() -> String {
        let backgroundImages = ["d1", "d2", "d3", "d4", "d5", "d6", "d7", "d8", "d9", "d10", "d11", "d12", "d13", "d14", "d15", "d16", "d17", "d18", "d19", "d20"]
        return backgroundImages.randomElement() ?? "defaultBackgroundImage"
    }

    private static func getRandomBadgeImage() -> String {
        let badgeImages = ["w", "b"]
        return badgeImages.randomElement() ?? "defaultBadgeImage"
    }

}
