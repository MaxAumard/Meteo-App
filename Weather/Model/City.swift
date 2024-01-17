//
//  City.swift
//  Weather
//
//  Created by Max Aumard on 03/02/2024.
//

import Foundation


struct City: Identifiable, Decodable {
    var id: UUID = UUID()
    var name: String
    var latitude: Double
    var longitude: Double
    
    init(name: String, latitude: Double, longitude: Double) {
        self.name = name
        self.latitude = latitude
        self.longitude = longitude
    }
}
	
