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

    var body: some View {
        VStack {
            if viewModel.isLoading {
                ProgressView("Chargement des données...")
            } else if let nowWeather = city.nowWeather {
                Text(city.name)
                    .font(.largeTitle)
                Text("Température actuelle: \(nowWeather.temperature)°C")
                    .font(.title)
                
                HourlyWeatherView(hourlyWeather: viewModel.hourlyWeather)
                
                DailyWeatherView(dailyWeather: viewModel.dailyWeather)
            } else if viewModel.showError {
                Text(viewModel.errorMessage)
            }
        }
        .onAppear {
            viewModel.fetchWeatherForecast(for: city)
        }
        .navigationTitle(city.name)
    }
}



struct HourlyWeatherView: View {
    var hourlyWeather: HourlyWeather?
    
    var body: some View {
        // Affichez ici les prévisions horaires
        if let hourlyWeather = hourlyWeather {
            // Utilisez une ScrollView ou une LazyHStack pour afficher les prévisions horaires
            ScrollView(.horizontal) {
                LazyHStack {
                    ForEach(0..<hourlyWeather.time.count, id: \.self) { index in
                        VStack {
                            Text(hourlyWeather.time[index])
                            Text("\(hourlyWeather.temperature[index])°C")
                            // Vous pouvez également afficher l'icône météo correspondante en fonction de weatherCode
                            // Exemple : Image(systemName: "cloud.sun.fill")
                        }
                        .padding()
                    }
                }
            }
        }
    }
}

struct DailyWeatherView: View {
    var dailyWeather: DailyWeather?
    
    var body: some View {
        // Affichez ici les prévisions quotidiennes
        if let dailyWeather = dailyWeather {
            // Utilisez une ScrollView ou une LazyVStack pour afficher les prévisions quotidiennes
            ScrollView {
                LazyVStack {
                    ForEach(0..<dailyWeather.time.count, id: \.self) { index in
                        VStack {
                            Text(dailyWeather.time[index])
                            Text("Min: \(dailyWeather.temperatureMin[index])°C")
                            Text("Max: \(dailyWeather.temperatureMax[index])°C")
                            // Vous pouvez également afficher l'icône météo correspondante en fonction de weatherCode
                            // Exemple : Image(systemName: "cloud.sun.fill")
                        }
                        .padding()
                    }
                }
            }
        }
    }
}
