//
//  WeatherApp.swift
//  Weather
//
//  Created by Max Aumard on 17/01/2024.
//

import SwiftUI
						

@main
struct WeatherApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationView {
                CityListView()
            }
        }
    }
}
