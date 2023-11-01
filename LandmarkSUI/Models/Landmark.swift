//
//  Landmark.swift
//  LandmarkSUI
//
//  Created by Виталий Гринчик on 21.09.23.
//

import Foundation
import CoreLocation

struct Landmark: Hashable, Codable, Identifiable {

    struct Coordinates: Hashable, Codable {
        var latitude: Double
        var longitude: Double
    }

    enum Category: String, CaseIterable, Codable {
        case lakes = "Lakes"
        case rivers = "Rivers"
        case mountains = "Mountains"
    }
    
    let name: String
    let category: Category
    let city: String
    let state: String
    let id: Int
    
    var isFeatured: Bool
    var isFavorite: Bool
    
    let park: String
    let description: String
    let coordinates: Coordinates
    
    var locationCoordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(
            latitude: coordinates.latitude,
            longitude: coordinates.longitude
        )
    }
    
    var imageName: String
}
