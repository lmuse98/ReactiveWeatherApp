//
//  FileManager.swift
//  ReactiveWeatherApp
//
//  Created by Luka Muše on 23.06.2022..
//

import Foundation
import RxSwift

struct FileManagerResource {
    let fileName: String
}

protocol FileManagerProvider {
    func load<T: Decodable>(resource: FileManagerResource) -> Observable<T>
}

final class FileManager: FileManagerProvider {
    func load<T: Decodable>(resource: FileManagerResource) -> Observable<T> {
        return Observable<T>.create { observer in
                debugPrint(observer)
            
            if let url = Bundle.main.url(forResource: resource.fileName, withExtension: "json") {
                debugPrint(url)
                do {
                    let data = try Data(contentsOf: url)
                    let decoder = JSONDecoder()
                    let jsonData = try decoder.decode(T.self, from: data)
                    observer.on(.next(jsonData))
                    observer.on(.completed)
                } catch {
                    print("error: \(error)")
                    observer.on(.error(error))
                }
            }
            else {
                print("didnt catch url")
            }
            return Disposables.create()
        }
    }
}
