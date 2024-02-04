//
//  WeatherService.swift
//  Weather
//
//  Created by Max Aumard on 03/02/2024.
//

import Foundation


class WeatherService {
    func fetchWeatherForecast(latitude: Double, longitude: Double) async throws -> (HourlyWeather,DailyWeather) {
        let url = URL(string: "https://api.open-meteo.com/v1/forecast?latitude=\(latitude)&longitude=\(longitude)&hourly=temperature_2m,weather_code&daily=temperature_2m_min,temperature_2m_max,weather_code")!
        let (data, _) = try await URLSession.shared.data(from: url)
        
        let decoder = JSONDecoder()
        let hourlyWeather = try decoder.decode(HourlyWeather.self, from: data)
        let dailyWeather = try decoder.decode(DailyWeather.self, from: data)
        return (hourlyWeather, dailyWeather)
    }
    
    func fetchWeatherNow(latitude: Double, longitude: Double) async throws -> NowWeather {
        guard let url = URL(string: "https://api.open-meteo.com/v1/forecast?latitude=\(latitude)&longitude=\(longitude)&current=temperature_2m,weather_code") else {
            fatalError("Invalid URL")
        }
        let (data, _) = try await URLSession.shared.data(from: url)
        return try JSONDecoder().decode(NowWeather.self, from: data)
    }
}
