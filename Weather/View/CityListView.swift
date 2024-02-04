//
//  CityListView.swift
//  Weather
//
//  Created by Max Aumard on 03/02/2024.
//

import Foundation

import SwiftUI

struct CityListView: View {
    @ObservedObject var viewModel = CityListViewModel()
    
    var body: some View {
        List {
            ForEach(viewModel.cities, id: \.id) { city in
                NavigationLink(destination: CityDetailView(city: city)) {
                    WeatherCard(location: "\(city.name), \(city.country)", temperature: "\(Int(city.nowWeather?.temperature ?? 0))°", condition: WeatherCondition(rawValue: city.nowWeather?.weatherCode ?? -1 )?.description ?? " ")
                }
                .listRowBackground(Color(UIColor.systemBackground))
                .cornerRadius(10)
                .shadow(radius: 5)
            }
            
            .onDelete(perform: removeCity)
        }
        .listStyle(PlainListStyle())
        .navigationTitle("Mes météos")
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                NavigationLink(destination: AddCityView(viewModel: viewModel)) {
                    Text("Ajouter une ville")
                }
            }
        }
        .onAppear {
            viewModel.fetchWeatherForAllCities()
        }
    }
    
    private func removeCity(at offsets: IndexSet){
        viewModel.cities.remove(atOffsets: offsets)
        viewModel.saveCities()
    }
}

struct WeatherCard: View {
    var location: String
    var temperature: String
    var condition: String
    
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text(location)
                    .font(.title)
                
                Spacer()
                
                Text(temperature)
                    .font(.title)
                    .fontWeight(.bold)
            }
            
            Text(condition)
                .font(.subheadline)
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .topLeading)
        .background(Color(UIColor.systemBackground))
        .cornerRadius(10)
        .shadow(radius: 5)
    }
}
