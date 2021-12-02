//
//  UIManager.swift
//  WeatherProject
//
//  Created by Igor Abovyan on 24.11.2021.
//

import UIKit

class UIManager: UIView {
    
    var cityLabel: UILabel!
    var temperatureLabel: UILabel!
    var descriptions: UILabel!
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.createCityLabel()
        self.createTemperatureLabel()
        self.createWeatherDescriptions()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK: - UI
extension UIManager {
    private func createCityLabel() {
        self.cityLabel = UILabel.init()
        self.cityLabel.frame.size.width = self.frame.width
        self.cityLabel.frame.size.height = 50
        self.cityLabel.center.x = self.frame.size.width / 2
        self.cityLabel.frame.origin.y = self.frame.size.height / 3
        cityLabel.font = UIFont.systemFont(ofSize: 40)
        self.addSubview(cityLabel)
    }
    
    private func createTemperatureLabel() {
        temperatureLabel = UILabel.init()
        temperatureLabel.frame.size.width = self.frame.size.width
        temperatureLabel.frame.size.height = 50
        temperatureLabel.frame.origin.x = 90
        temperatureLabel.frame.origin.y = 170
        temperatureLabel.font = UIFont.systemFont(ofSize: 50)
        self.addSubview(temperatureLabel)
    }
        
    private func createWeatherDescriptions() {
        descriptions = UILabel.init()
        descriptions.frame.size.width = self.frame.size.width
        descriptions.frame.size.height = 50
        descriptions.center.x = self.frame.size.width * 0.6
        descriptions.frame.origin.y = 300
        descriptions.font = UIFont.systemFont(ofSize: 30)
        self.addSubview(descriptions)
    }
}
