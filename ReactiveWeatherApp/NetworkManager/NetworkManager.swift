//
//  NetworkManager.swift
//  ReactiveWeatherApp
//
//  Created by Luka Muše on 16.05.2022..
//

import Foundation
import RxSwift

final class NetworkManager {
    func load<T: Decodable>(resource: Resource<T>) -> Observable<T> {
        if resource.parameter != nil {
            return URL.loadWithPayLoad(resource: resource)
        } else {
            return URL.load(resource: resource)
        }
    }
}
