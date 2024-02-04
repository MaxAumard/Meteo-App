//
//  WeatherData.swift
//  Weather
//
//  Created by Max Aumard on 03/02/2024.
//

import Foundation
		

struct WeatherData: Decodable {
}


struct NowWeather: Codable {
    var temperature: Double
    var weatherCode: Int
    
    private enum RootKeys: String, CodingKey {
        case current
    }
    
    private enum CurrentKeys: String, CodingKey {
        case temperature = "temperature_2m"
        case weatherCode = "weather_code"
    }
    
    init(from decoder: Decoder) throws {
        let rootContainer = try decoder.container(keyedBy: RootKeys.self)
        let currentContainer = try rootContainer.nestedContainer(keyedBy: CurrentKeys.self, forKey: .current)
        temperature = try currentContainer.decode(Double.self, forKey: .temperature)
        weatherCode = try currentContainer.decode(Int.self, forKey: .weatherCode)
    }
}


struct HourlyWeather: Decodable {
    let time: [String]
    let temperature: [Double]
    let weatherCode: [Int]

    enum CodingKeys: String, CodingKey {
        case hourly
    }

    enum HourlyKeys: String, CodingKey {
        case time
        case temperature = "temperature_2m"
        case weatherCode = "weather_code"
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let hourlyContainer = try container.nestedContainer(keyedBy: HourlyKeys.self, forKey: .hourly)
        time = try hourlyContainer.decode([String].self, forKey: .time)
        temperature = try hourlyContainer.decode([Double].self, forKey: .temperature)
        weatherCode = try hourlyContainer.decode([Int].self, forKey: .weatherCode)
    }
    
    init(time: [String], temperature: [Double], weatherCode: [Int]) {
        self.time = time
        self.temperature = temperature
        self.weatherCode = weatherCode
        
    }
    
}


struct DailyWeather: Decodable {
    let time: [String]
    let temperatureMin: [Double]
    let temperatureMax: [Double]
    let weatherCode: [Int]

    enum CodingKeys: String, CodingKey {
        case daily
    }

    enum DailyKeys: String, CodingKey {
        case time
        case temperatureMin = "temperature_2m_min"
        case temperatureMax = "temperature_2m_max"
        case weatherCode = "weather_code"
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let dailyContainer = try container.nestedContainer(keyedBy: DailyKeys.self, forKey: .daily)
        time = try dailyContainer.decode([String].self, forKey: .time)
        temperatureMin = try dailyContainer.decode([Double].self, forKey: .temperatureMin)
        temperatureMax = try dailyContainer.decode([Double].self, forKey: .temperatureMax)
        weatherCode = try dailyContainer.decode([Int].self, forKey: .weatherCode)
    }
}


    
