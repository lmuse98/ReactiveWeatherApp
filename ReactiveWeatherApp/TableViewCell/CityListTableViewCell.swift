//
//  CityListTableViewCell.swift
//  ReactiveWeatherApp
//
//  Created by Luka Muše on 15.06.2022..
//

import UIKit

class CityListTableViewCell: UITableViewCell {
    
    struct Constant {
        static let cellName = "CityListCell"
    }
    
    private lazy var backView: UIView = {
        let backView = UIView()
        return backView
    }()
    
    private lazy var labelCityName: UILabel = {
        let label = UILabel()
        
        return label
    }()
    
    private lazy var labelCityTemperature: UILabel = {
        let label = UILabel()
        
        return label
    }()
    
    private lazy var weatherImageView: UIImageView = {
        let image = UIImageView()

        return image
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        setupViews()
        setupConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
        addSubview(backView)
        backView.addSubview(labelCityName)
        backView.addSubview(labelCityTemperature)
        backView.addSubview(weatherImageView)
    }
    
    func setupConstraints() {
        
    }
    
    func configure(_ data: WeatherDataModel?) {
        guard let data = data else { return }
        labelCityName.text = data.cityName
        labelCityTemperature.text = data.temperature
        weatherImageView.setImage(url: data.iconURL)
    }
}
