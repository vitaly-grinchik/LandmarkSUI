//
//  Hike.swift
//  LandmarkSUI
//
//  Created by Виталий Гринчик on 22.09.23.
//

import Foundation

struct Hike: Codable, Hashable, Identifiable {
    
    var name: String
    let id: Int
    var distance: Double
    var difficulty: Int
    var observations: [Observation]

    static var formatter = LengthFormatter()

    var distanceText: String {
        Hike.formatter
            .string(fromValue: distance, unit: .kilometer)
    }
    
    struct Observation: Codable, Hashable {
        var elevation: Range<Double>
        var pace: Range<Double>
        var heartRate: Range<Double>
        var distanceFromStart: Double
    }
}

