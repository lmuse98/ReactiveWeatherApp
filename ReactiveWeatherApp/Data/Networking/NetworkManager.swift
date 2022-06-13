//
//  NetworkManager.swift
//  ReactiveWeatherApp
//
//  Created by Luka Muše on 16.05.2022..
//

import Foundation
import RxSwift

protocol NetworkManagerProvider {
    func load<T: Decodable>(resource: Resource, type: T.Type) -> Single<T>
}

final class NetworkManager: NetworkManagerProvider {
    
    let client: NetworkClientProvider
    
    init(client: NetworkClientProvider) {
        self.client = client
    }
    
    func load<T: Decodable>(resource: Resource, type: T.Type) -> Single<T> {
        if resource.parameter != nil {
            return client.load(resource: resource, response: type.self)
        } else {
            return .error(NetworkError.badURL)
        }
    }
}
