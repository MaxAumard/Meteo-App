//
//  WeatherData.swift
//  Weather
//
//  Created by Max Aumard on 03/02/2024.
//

import Foundation
		

struct WeatherData: Decodable {
    let hourly: HourlyWeather
    let daily: DailyWeather
}

struct HourlyWeather: Decodable {
    let time: [String]
    let temperature: [Double]
    let weatherCode: [Int]
    
    enum CodingKeys: String, CodingKey {
        case time
        case temperature = "temperature_2m"
        case weatherCode = "weather_code"
    }
}

struct DailyWeather: Decodable {
    let time: [String]
    let temperatureMin: [Double]
    let temperatureMax: [Double]
    let weatherCode: [Int]
    
    enum CodingKeys: String, CodingKey {
        case time
        case temperatureMin = "temperature_2m_min"
        case temperatureMax = "temperature_2m_max"
        case weatherCode = "weather_code"

    }
}

struct NowWeather: Decodable {
    let temperature: Double
    let weatherCode: Int
    
    enum CodingKeys: String, CodingKey {
        case temperature = "temperature_2m"
        case weatherCode = "weather_code"
    }
}

