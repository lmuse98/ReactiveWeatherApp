//
//  WeatherViewController.swift
//  ReactiveWeatherApp
//
//  Created by Luka Muše on 11.05.2022..
//

import UIKit
import SnapKit

class WeatherViewController: UIViewController {
    
    private var tempLabel: UILabel = {
        let temp = UILabel()
        temp.text = "0"
        temp.textColor = .black
        return temp
    }()
    
    private var textField: UITextField = {
        let textField = UITextField()
        textField.layer.cornerRadius = 4
        textField.backgroundColor = .white
        return textField
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .cyan
        setupViews()
        setupConstraints()
    }
    
    private func setupViews() {
        view.addSubview(tempLabel)
        view.addSubview(textField)
    }
    
    private func setupConstraints() {
        tempLabel.snp.makeConstraints { make in
            make.bottom.equalTo(textField).offset(40)
            make.centerX.equalTo(view)
        }
        textField.snp.makeConstraints { make in
            make.leading.equalTo(view).offset(40)
            make.trailing.equalTo(view).inset(40)
            make.height.equalTo(50)
            make.centerY.centerX.equalTo(view)
        }
    }

}

