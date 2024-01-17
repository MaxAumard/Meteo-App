//
//  IdentifiableError.swift
//  Weather
//
//  Created by Max Aumard on 03/02/2024.
//

import Foundation

struct IdentifiableError: Identifiable {
    let id = UUID()
    let message: String
}
