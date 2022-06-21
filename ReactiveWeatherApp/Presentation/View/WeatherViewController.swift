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
        configureItems()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureItems() {
        navigationController?.setCustomStyle()
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: nil)
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .search, target: self, action: #selector(showSearchBar))
    }
    
    @objc func showSearchBar() {
        let cityVC = CitySearchViewController()
        navigationController?.present(UINavigationController(rootViewController: cityVC), animated: true)
    }
    
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
        
        navigationItem.title = "Home"
        view.backgroundColor = .white
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

