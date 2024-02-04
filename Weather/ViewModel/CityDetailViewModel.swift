//
//  CityDetailViewModel.swift
//  Weather
//
//  Created by Max Aumard on 03/02/2024.
//

import Foundation

@MainActor
class CityDetailViewModel: ObservableObject {
    @Published var hourlyWeather: HourlyWeather?
    @Published var dailyWeather: DailyWeather?
    @Published var isLoading = false
    @Published var showError = false
    var errorMessage = ""

    private var weatherService = WeatherService()

    func fetchWeatherForecast(for city: CityLocation) {
        isLoading = true
        Task {
            do {
                let data : (HourlyWeather, DailyWeather) = try await weatherService.fetchWeatherForecast(latitude: city.latitude, longitude: city.longitude)
                DispatchQueue.main.async {
                    self.hourlyWeather = self.adjustHourlyWeatherData(hourlyWeather: data.0)
                    self.dailyWeather = data.1
                    self.isLoading = false
                }
            } catch {
                DispatchQueue.main.async {
                    self.errorMessage = "Erreur lors du chargement des données météo."
                    self.showError = true
                    self.isLoading = false
                }
            }
        }
    }
    
    func adjustHourlyWeatherData(hourlyWeather: HourlyWeather) -> HourlyWeather {
            let formatter = DateFormatter()
            formatter.dateFormat = "yyyy-MM-dd'T'HH:mm"
            formatter.timeZone = TimeZone.current
            
            let currentDate = Date()
            let currentHourString = formatter.string(from: currentDate)
            
            guard let currentIndex = hourlyWeather.time.firstIndex(where: { $0 >= currentHourString }) else {
                return hourlyWeather
            }
            let endIndex = min(currentIndex + 24, hourlyWeather.time.count)
            
            return HourlyWeather(
                time: Array(hourlyWeather.time[currentIndex..<endIndex]),
                temperature: Array(hourlyWeather.temperature[currentIndex..<endIndex]),
                weatherCode: Array(hourlyWeather.weatherCode[currentIndex..<endIndex])
            )
        }
}
