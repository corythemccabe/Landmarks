//
//  Hike.swift
//  Landmarks
//
//  Created by Cory McCabe on 10/30/24.
//

import Foundation

struct Hike: Codable, Identifiable, Hashable {
    let id: Int
    let name: String
    let distance: Double
    let difficulty: Int
    let observations: [Observation]
    
    static var formatter = LengthFormatter()
        
    var distanceText: String {
        Hike.formatter.string(fromValue: distance, unit: .kilometer)
    }
    
    struct Observation: Codable, Hashable {
        let distanceFromStart: Double
        
        var elevation: Range<Double>
        var pace: Range<Double>
        var heartRate: Range<Double>
    }
    
}
