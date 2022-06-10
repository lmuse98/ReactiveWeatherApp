//
//  WeatherViewController.swift
//  ReactiveWeatherApp
//
//  Created by Luka Muše on 11.05.2022..
//

import UIKit
import SnapKit

class WeatherViewController: UIViewController {
    
    private let viewModel: WeatherViewModel
    
    init(viewModel: WeatherViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil , bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private var tempLabel: UILabel = {
        let temp = UILabel()
        temp.text = "0"
        temp.textColor = .black
        return temp
    }()
    
    private var textField: UITextField = {
        let textField = UITextField()
        textField.layer.cornerRadius = 5
        textField.placeholder = "Enter the city name"
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
        }
        textField.snp.makeConstraints { make in
            make.leading.equalTo(view).offset(40)
            make.trailing.equalTo(view).inset(40)
            make.height.equalTo(40)
            make.centerY.equalTo(view).offset(-30)
        }
    }

}

