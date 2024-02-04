//
//  WeatherCondition.swift
//  Weather
//
//  Created by Max Aumard on 04/02/2024.
//

import Foundation

enum WeatherCondition: Int {
    case clearSky = 0
    case mainlyClear = 1
    case partlyCloudy = 2
    case overcast = 3
    
    case fog = 45
    case fogAndDepositingRimeFog = 48
    
    case drizzleLight = 51
    case drizzleModerate = 53
    case drizzleDense = 55
    
    case freezingDrizzleLight = 56
    case freezingDrizzleDense = 57
    
    case rainSlight = 61
    case rainModerate = 63
    case rainHeavy = 65
    
    case freezingRainLight = 66
    case freezingRainHeavy = 67
    
    case snowFallSlight = 71
    case snowFallModerate = 73
    case snowFallHeavy = 75
    
    case snowGrains = 77
    
    case rainShowersSlight = 80
    case rainShowersModerate = 81
    case rainShowersViolent = 82
    
    case snowShowersSlight = 85
    case snowShowersHeavy = 86
    
    case thunderstormSlight = 95
    case thunderstormModerate = 96
    case thunderstormHeavy = 99

    var description: String {
        switch self {
        case .clearSky: return "Ciel dégagé"
        case .mainlyClear: return "Ciel principalement dégagé"
        case .partlyCloudy: return "Ciel partiellement nuageux"
        case .overcast: return "Ciel couvert"
        
        case .fog: return "Brouillard"
        case .fogAndDepositingRimeFog: return "Brouillard et givre"
        
        case .drizzleLight: return "Pluie fine légère"
        case .drizzleModerate: return "Pluie fine modérée"
        case .drizzleDense: return "Pluie fine dense"
        
        case .freezingDrizzleLight: return "Pluie verglaçante légère"
        case .freezingDrizzleDense: return "Pluie verglaçante dense"
        
        case .rainSlight: return "Pluie légère"
        case .rainModerate: return "Pluie modérée"
        case .rainHeavy: return "Pluie forte"
        
        case .freezingRainLight: return "Pluie verglaçante légère"
        case .freezingRainHeavy: return "Pluie verglaçante forte"
        
        case .snowFallSlight: return "Chute de neige légère"
        case .snowFallModerate: return "Chute de neige modérée"
        case .snowFallHeavy: return "Chute de neige forte"
        
        case .snowGrains: return "Grains de neige"
        
        case .rainShowersSlight: return "Averses de pluie légères"
        case .rainShowersModerate: return "Averses de pluie modérées"
        case .rainShowersViolent: return "Averses de pluie violentes"
        
        case .snowShowersSlight: return "Averses de neige légères"
        case .snowShowersHeavy: return "Averses de neige fortes"
        
        case .thunderstormSlight: return "Orage léger"
        case .thunderstormModerate: return "Orage modéré"
        case .thunderstormHeavy: return "Orage fort"
        }
    }
}
