//
//  HourlyView.swift
//  Weather
//
//  Created by Max Aumard on 04/02/2024.
//

import Foundation
import SwiftUI


struct HourlyWeatherView: View {
    var hourlyWeather: HourlyWeather?
    
    var body: some View {
        VStack {
            if let hourlyWeather = hourlyWeather {
                HStack {
                    Image(systemName: "clock.fill")
                        .foregroundColor(.gray)
                    Text("Prévisions horaires")
                        .font(.headline)
                        .foregroundColor(.primary)
                }
                
                ScrollView(.horizontal, showsIndicators: false) {
                    LazyHStack(spacing: 20) {
                        ForEach(0..<hourlyWeather.time.count, id: \.self) { index in
                            VStack {
                                Text(hourlyWeather.time[index].components(separatedBy: "T")[1].components(separatedBy: ":")[0])
                                    .font(.headline)
                                    .padding(.vertical, 10)
                                Image(systemName: WeatherCondition(rawValue: hourlyWeather.weatherCode[index] )?.iconName ?? "")
                                    .font(.title)
                                Text("\(Int(hourlyWeather.temperature[index]))°")
                                    .font(.headline)
                                    .padding(.vertical, 10)
                            }
                            .background(Color(UIColor.systemBackground))
                            .cornerRadius(10)
                        }
                    }
                    .padding(.horizontal)
                    .padding(.vertical, 10)

                }
                .background(Color(UIColor.systemBackground))
                .cornerRadius(15)
                .shadow(radius: 5)
                .padding(.horizontal, 15)

            }
        }.frame(maxHeight: 180)
    }
}
