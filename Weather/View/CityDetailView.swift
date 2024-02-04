//
//  CityDetailView.swift
//  Weather
//
//  Created by Max Aumard on 03/02/2024.
//

import Foundation
import SwiftUI


struct CityDetailView: View {
    var city: CityLocation
    @StateObject private var viewModel = CityDetailViewModel()
    @EnvironmentObject private var temperatureSettings: TemperatureSettings

    var body: some View {
        VStack {
            if viewModel.isLoading {
                ProgressView("Chargement des données...")
            } else if let nowWeather = city.nowWeather {
                VStack(spacing: 5) {

                Text(city.name)
                    .font(.largeTitle)
                    Text("\(nowWeather.temperature.formatTemperature(unit: temperatureSettings.unit))°")
                    .font(.largeTitle)
                    .bold()
                
                Text(WeatherCondition(rawValue: city.nowWeather?.weatherCode ?? -1)?.description ?? "")
                }.padding(.top, -30)
                    .padding(.bottom, 20)
                HourlyWeatherView(hourlyWeather: viewModel.hourlyWeather)
                
                DailyWeatherView(dailyWeather: viewModel.dailyWeather)
            } else if viewModel.showError {
                Text(viewModel.errorMessage)
            }
        }
        .onAppear {
            viewModel.fetchWeatherForecast(for: city)
        }

    }
}

