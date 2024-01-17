//
//  GeocodingService.swift
//  Weather
//
//  Created by Max Aumard on 03/02/2024.
//

import Foundation


class GeocodingService {
    func searchCity(name: String) async throws -> [CityLocation] {
        let encodedName = name.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
        guard let url = URL(string: "https://geocoding-api.open-meteo.com/v1/search?name=\(encodedName!)&count=10&language=en&format=json") else {
            fatalError("Invalid URL")
        }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        let searchResults = try JSONDecoder().decode(CitySearchResult.self, from: data)
        return searchResults.results
    }
}
