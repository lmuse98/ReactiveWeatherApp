//
//  NavigationBar.swift
//  ReactiveWeatherApp
//
//  Created by Luka Muše on 15.06.2022..
//

import UIKit

class NavigationBar: UINavigationController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setCustomStyle()
    }
}

extension UINavigationController {
    func setCustomStyle() {
        navigationBar.isTranslucent = false
        
        navigationBar.tintColor = .blue
        
        navigationBar.barTintColor = .black

        navigationBar.titleTextAttributes = [.font: UIFont.navigationBarTitle,
                                             .foregroundColor: UIColor.black]

        let attribute = [NSAttributedString.Key.font: UIFont.navigationBarButtonItem]

        UIBarButtonItem.appearance().setTitleTextAttributes(attribute, for: UIControl.State.normal)

        view.backgroundColor = .barTintColor
        
    }
}
