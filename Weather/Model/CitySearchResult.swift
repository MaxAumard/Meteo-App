//
//  CitySearchResult.swift
//  Weather
//
//  Created by Max Aumard on 03/02/2024.
//

import Foundation

struct CitySearchResult: Decodable {
    var results: [CityLocation]
}

struct CityLocation: Codable, Identifiable {
    let id: Int
    let name: String
    let country: String	
    let latitude: Double
    let longitude: Double
}
