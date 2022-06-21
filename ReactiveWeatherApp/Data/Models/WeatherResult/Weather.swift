//
//  Weather.swift
//  ReactiveWeatherApp
//
//  Created by Luka Muše on 11.05.2022..
//

import Foundation

struct Weather: Codable {
    let main: MainModel?
    let weather: [WeatherResult]?
    let sys: SysModel?
    var name: String?
    
}

struct MainModel: Codable {
    let temp: Double
    let pressure: Double
    let humidity: Double
    let tempMin: Double
    let tempMax: Double
    
    enum CodingKeys: String, CodingKey {
        case temp
        case pressure
        case humidity
        case tempMin = "temp_min"
        case tempMax = "temp_max"
    }
}


struct WeatherResult: Codable {
    let id: Int
    let main: String
    let description: String
    let icon: String
}

struct SysModel: Codable, Equatable {
    let timezone: Int64?
    let country: String?
    let sunrise: Double?
    let sunset: Double?
}


