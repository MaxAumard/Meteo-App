//
//  TemperatureUnit.swift
//  Weather
//
//  Created by Max Aumard on 04/02/2024.
//

import Foundation

enum TemperatureUnit: String {
    case celsius = "°C"
    case fahrenheit = "°F"


}

extension Double {
    func formatTemperature(unit: TemperatureUnit) -> String {
        switch unit {
        case .celsius:
            return String(format: "%.0f", self)
        case .fahrenheit:
            let temperatureInFahrenheit = (self * 9/5) + 32
            return String(format: "%.0f", temperatureInFahrenheit)
        }
    }
}

class TemperatureSettings: ObservableObject {
    @Published var unit: TemperatureUnit {
        didSet {
            UserDefaults.standard.set(unit.rawValue, forKey: "TemperatureUnit")
        }
    }
    
    init() {
        let value = UserDefaults.standard.string(forKey: "TemperatureUnit") ?? TemperatureUnit.celsius.rawValue
        self.unit = TemperatureUnit(rawValue: value) ?? .celsius
    }
}
