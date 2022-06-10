//
//  NetworkClient.swift
//  ReactiveWeatherApp
//
//  Created by Luka Muše on 07.06.2022..
//

import Foundation
import UIKit
import RxCocoa
import RxSwift

protocol NetworkClientProvider {
    func load<T: Decodable>(resource: Resource, response: T.Type) -> Single<T>
    func loadWithPayLoad<T: Decodable>(resource: Resource) -> Observable<T>
}

struct Resource {
    let url: URL
    let parameter: [String: String]?
}

class NetworkClient: NetworkClientProvider {
    
     func load<T: Decodable>(resource: Resource, response: T.Type) -> Single<T> {
        return Observable.just(resource.url)
             .debug("apiiiii",trimOutput: false)
            .flatMap { url -> Observable<(response: HTTPURLResponse, data: Data)> in
                let request = URLRequest(url: url)
                debugPrint(resource.url)
                return URLSession.shared.rx.response(request: request)
            }.map { response, data -> T in

                if 200 ..< 300 ~= response.statusCode {
                    return try JSONDecoder().decode(T.self, from: data)
                } else {
                    throw NetworkError.badStatusCode
                }

            }.asSingle()
    }

    func loadWithPayLoad<T: Decodable>(resource: Resource) -> Observable<T> {
        return Observable.just(resource.url)
            .flatMap { [weak self] url -> Observable<(response: HTTPURLResponse, data: Data)> in
                
                guard let self = self else { return .error(NetworkError.unknown)}
                //let request = URLRequest(url: self.loadURL(resource: resource) ?? url)
                //return URLSession.shared.rx.response(request: request)
                
                return .empty()
            }.map { response, data -> T in
                
                if 200 ..< 300 ~= response.statusCode {
                    return try JSONDecoder().decode(T.self, from: data)
                } else {
                    throw NetworkError.badStatusCode
                }
                
            }.asObservable()
    }
    /*
    func loadURL<T>(resource: Resource) -> URL? {
        if
            let parameters = resource.parameter,
            let urlComponents = URLComponents(url: resource.url, resolvingAgainstBaseURL: false) {
            var components = urlComponents
            components.queryItems = parameters.map { (arg) -> URLQueryItem in
                let (key, value) = arg
                return URLQueryItem(name: key, value: value)
            }
            components.percentEncodedQuery = components.percentEncodedQuery?.replacingOccurrences(of: "+", with: "%2B")
            return components.url
        }
        return nil
    }
     */
}

enum NetworkClientErrror {
    case clientError
    case noConnection
    case decodingFailed
    case serverError
    case generic
}

