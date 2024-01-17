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
        List(viewModel.cities) { city in
            Text("\(city.name), \(city.country)")
        }
        .navigationTitle("Mes météos")
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                NavigationLink(destination: AddCityView(viewModel: viewModel)) {
                    Text("Ajouter une ville")
                }
            }
        }
    }
}

