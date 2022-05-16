//
//  Weather.swift
//  ReactiveWeatherApp
//
//  Created by Luka Muše on 11.05.2022..
//

import Foundation

struct WeatherResult: Codable {
    let main: Weather
    let name: String
    let weather: [Condition]
    let timezone: Int
}

struct Weather: Codable {
    let temp: Double
    let humidity: Double
    let feels_like: Double
}

struct Condition: Codable {
    let id: Int
    let main: String
    var conditionName: String {
        switch id {
        case 200...232:
            return "cloud.bolt"
        case 300...321:
            return "cloud.drizzle"
        case 500...531:
            return "cloud.rain"
        case 600...622:
            return "cloud.snow"
        case 701...781:
            return "cloud.fog"
        case 800:
            return "sun.max"
        case 801...804:
            return "cloud.bolt"
        default:
            return "exclamationmark.circle"
        }
    }
}

