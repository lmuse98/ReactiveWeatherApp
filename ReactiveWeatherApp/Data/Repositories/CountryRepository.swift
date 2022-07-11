//
//  CountryRepository.swift
//  ReactiveWeatherApp
//
//  Created by Luka Muše on 27.06.2022..
//

import Foundation
import RxSwift
import RxRelay

final class CountryRepository {
    
    let disposeBag = DisposeBag()
    private let fileManager: FileManager
    
    
    init(fileManager: FileManager) {
        self.fileManager = fileManager
    }
    
    func getCityCountryList() -> Observable<[CityListModel]> {
        let resource: FileManagerResource = FileManagerResource(fileName: "list")
        return fileManager.load(resource: resource)
    }
    
}
