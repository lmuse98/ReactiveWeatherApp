//
//  CityWeatherModel.swift
//  ReactiveWeatherApp
//
//  Created by Luka Muše on 26.05.2022..
//

import Foundation

struct CityWeatherModel: Codable {
    var cnt: Int?
    var list: [Weather]
}
