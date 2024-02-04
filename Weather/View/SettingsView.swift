//
//  SettingsView.swift
//  Weather
//
//  Created by Max Aumard on 04/02/2024.
//


import Foundation
import SwiftUI

struct SettingsView: View {
    @EnvironmentObject var temperatureSettings: TemperatureSettings
    
    var body: some View {
        Form {
            Picker("Unité de température", selection: $temperatureSettings.unit) {
                Text("Celsius").tag(TemperatureUnit.celsius)
                Text("Fahrenheit").tag(TemperatureUnit.fahrenheit)
            }
            .pickerStyle(SegmentedPickerStyle())
        }
        .navigationTitle("Paramètres")
    }
}
