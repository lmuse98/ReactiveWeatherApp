//
//  SettingsUnit.swift
//  ReactiveWeatherApp
//
//  Created by Luka Muše on 23.05.2022..
//

import Foundation

enum SettingsUnit: String, CaseIterable {
    case celsius = "metric"
    case farenheit = "imperial"
}

extension SettingsUnit {
    var displayName: String {
        switch self {
        case .celsius:
            return "celsius"
        case .farenheit:
            return "farenheit"
        }
    }
    
    var unitSymbol: String {
        switch self {
        case .celsius:
            return "°C"
        case .farenheit:
            return "°F"
        }
    }
}
