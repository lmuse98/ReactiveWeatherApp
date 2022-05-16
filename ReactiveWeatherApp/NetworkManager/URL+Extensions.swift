//
//  URL + Extensions.swift
//  ReactiveWeatherApp
//
//  Created by Luka Muše on 16.05.2022..
//

import Foundation

extension URL {
    static func urlWeatherApi(city: String) -> URL? {
        return URL(string: ApiKey.baseURL + "data/2.5/weather?q=\(city)&APPID=\(ApiKey.appId)&units=metric")
    }
}

struct ApiKey {
    static let appId = "d382b8e94c94fc8fa27abe9bcf571c86"
    static let baseURL = "https://api.openweathermap.org/"
    
    static let uniMetric = "metric"
    static let unitImperial = "imperial"
}
