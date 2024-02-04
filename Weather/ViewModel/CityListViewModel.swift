//
//  CityListViewModel.swift
//  Weather
//
//  Created by Max Aumard on 03/02/2024.
//

import Foundation

class CityListViewModel: ObservableObject {
    @Published var cities: [CityLocation] = []
    @Published var showError: Bool = false
    var errorMessage: String = ""
    
    init() {
        loadCities()
    }

    
    func addCity(_ city: CityLocation) {
        if !cities.contains(where: { $0.name == city.name }) {
            DispatchQueue.main.async {
                self.cities.append(city)
                self.saveCities()
            }
        } else {
            errorMessage = "\(city.name) est déjà dans la liste."
            showError = true
        }
    }
    
    func saveCities() {
        if let encoded = try? JSONEncoder().encode(cities) {
            UserDefaults.standard.set(encoded, forKey: "SavedCities")
        }
    }

    func loadCities() {
        if let savedCities = UserDefaults.standard.data(forKey: "SavedCities"),
           let decodedCities = try? JSONDecoder().decode([CityLocation].self, from: savedCities) {
            cities = decodedCities
        }
    }
    
    func removeCity(_ city: CityLocation) {
        if let index = cities.firstIndex(where: { $0.id == city.id }) {
            DispatchQueue.main.async {
                self.cities.remove(at: index)
                self.saveCities()
            }
        }
    }

    
    func fetchWeatherForAllCities() {
        for i in 0..<cities.count {
            let city = cities[i]
            Task {
                do {
                    let nowWeather = try await WeatherService().fetchWeatherNow(latitude: city.latitude, longitude: city.longitude)
                    DispatchQueue.main.async {
                        self.cities[i].nowWeather = nowWeather
                    }
                } catch {
                    DispatchQueue.main.async {
                        self.errorMessage = "Impossible de récupérer la météo pour \(city.name)."
                        self.showError = true
                    }
                }
            }
        }
    }


}

