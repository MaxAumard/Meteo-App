//
//  AddCityView.swift
//  Weather
//
//  Created by Max Aumard on 03/02/2024.
//

import Foundation
import SwiftUI



struct AddCityView: View {
    @ObservedObject var viewModel: CityListViewModel
    @Environment(\.presentationMode) var presentationMode
    @State private var searchQuery = ""
    @State private var searchResults: [CityLocation] = []

    var body: some View {
        VStack {
            TextField("Rechercher une ville", text: $searchQuery)
                .padding()
            
            Button("Rechercher") {
                Task {
                    searchResults = try await GeocodingService().searchCity(name: searchQuery)
                }
            }
            
            List(searchResults) { city in
                Button(action: {
                    viewModel.addCity(city)
                    if !viewModel.showError {
                        presentationMode.wrappedValue.dismiss()
                    }
                }) {
                    Text("\(city.name), \(city.country)")
                }
            }
        }
        .alert("Erreur", isPresented: $viewModel.showError) {
            Button("OK", role: .cancel) { }
        } message: {
            Text(viewModel.errorMessage)
        }
        .navigationTitle("Ajouter une ville")
    }
}
