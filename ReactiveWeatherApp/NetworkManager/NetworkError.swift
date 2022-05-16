//
//  NetworkError.swift
//  ReactiveWeatherApp
//
//  Created by Luka Muše on 16.05.2022..
//

import Foundation

enum NetworkError: Error {
    case badURL
    case unknown
    case timeout
}
