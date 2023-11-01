//
//  ModelData.swift
//  LandmarkSUI
//
//  Created by Виталий Гринчик on 21.09.23.
//

import Foundation
import Combine

// ViewModel - одная для всего приложения (не обязательное условие)
//
// An observable object is a custom object for your data that can be bound to
// a view from storage in SwiftUI’s environment. SwiftUI watches for any changes
// to observable objects that could affect a view, and displays the correct
// version of the view after a change.
final class ModelData: ObservableObject {
    // OWNN models
    @Published var landmarks: [Landmark] = load("landmarkData.json")
    @Published var profile = Profile.default
    
    var hikes: [Hike] = load("hikeData.json")
    
    var features: [Landmark] {
        landmarks.filter { $0.isFeatured }
    }
    
    var favorites: [Landmark] {
        landmarks.filter { $0.isFavorite }
    }
    
    var categories: [String: [Landmark]] {
        Dictionary(
            grouping: landmarks,
            by: { $0.category.rawValue }
        )
    }
    
    var favoriteCount: Int {
        favorites.count
    }
    
}

func load<T: Decodable>(_ filename: String) -> T {
    let data: Data

    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
    else {
        fatalError("Couldn't find \(filename) in main bundle.")
    }

    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }

    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}


