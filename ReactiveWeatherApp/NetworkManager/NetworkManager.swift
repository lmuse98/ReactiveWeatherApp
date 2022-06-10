//
//  NetworkManager.swift
//  ReactiveWeatherApp
//
//  Created by Luka Muše on 16.05.2022..
//

import Foundation
import RxSwift

protocol NetworkingManager {
    func load<T: Decodable>(resource: Resource, type: T.Type) -> Single<T>
}

final class NetworkManager: NetworkingManager {
    
    let netClient = NetworkClient()
    
    init() {
        
    }
    
    func load<T: Decodable>(resource: Resource, type: T.Type) -> Single<T> {
        if resource.parameter != nil {
            return netClient.load(resource: resource, response: type.self)
        } else {
            return .error(NetworkError.badURL)
        }
    }
}
