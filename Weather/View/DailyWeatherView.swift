//
//  DailyWeatherView.swift
//  Weather
//
//  Created by Max Aumard on 04/02/2024.
//

import Foundation
import SwiftUI


struct DailyWeatherView: View {
    var dailyWeather: DailyWeather?
    @EnvironmentObject private var temperatureSettings: TemperatureSettings

    var body: some View {
        if let dailyWeather = dailyWeather {
            VStack(alignment: .leading, spacing: 10) {
                HStack {
                    Image(systemName: "calendar")
                    Text("Prévisions de la semaine").font(.headline)
                }
                .padding(.horizontal, 30)
                ForEach(0..<dailyWeather.time.count, id: \.self) { index in
                    HStack {
                        Text(dayOfWeek(from: dailyWeather.time[index]))
                            .font(.body)
                            .frame(width: 50, alignment: .leading)
                        
                        Spacer()
                        
                        Image(systemName: WeatherCondition(rawValue: dailyWeather.weatherCode[index])?.iconName ?? "sun.max")
                        
                        Spacer()
                        
                        Text("\(dailyWeather.temperatureMin[index].formatTemperature(unit: temperatureSettings.unit))°")
                            .frame(width: 50, alignment: .leading)
                        
                        Text("\(dailyWeather.temperatureMax[index].formatTemperature(unit: temperatureSettings.unit))°")
                            .frame(width: 50, alignment: .trailing)
                    }
                    .padding(.horizontal, 30)
                }
            }
            .padding(.vertical, 30)
        }
    }
    
    func dayOfWeek(from dateString: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        if let date = dateFormatter.date(from: dateString) {
            dateFormatter.dateFormat = "EEEE"
            return dateFormatter.string(from: date)
        }
        return ""
    }
}

