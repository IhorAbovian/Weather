//
//  ViewController.swift
//  WeatherProject
//
//  Created by Igor Abovyan on 23.11.2021.
//

import UIKit

class ViewController: UIViewController {
    
    var city: UIManager!
//    var weatherData: WeatherData!
    var dataDelegate: WeatherData!
}

//MARK: - Controller Life cycle
extension ViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.config()
    }
}

//MARK: - Configuration
extension ViewController {
    private func config() {
        self.createSearchButton()
        self.addCityLabel()
        
    }
    
    private func createSearchButton() {
        let button = UIBarButtonItem.init(barButtonSystemItem: .search, target: self, action: #selector(searchVC))
        navigationItem.rightBarButtonItem = button
        navigationItem.title = "Weather"
    }
    
    @objc private func searchVC() {
        let vc = SearchVC.init()
        vc.myDelegate = self
        navigationController?.pushViewController(vc, animated: true)
    }
    
    private func addCityLabel() {
        let origin = CGPoint.init(x: self.view.frame.size.width / 4, y: self.view.frame.size.height / 4)
        let size = CGSize.init(width: self.view.frame.size.width, height: 50)
        city = UIManager.init(frame: CGRect.init(origin: origin, size: size))
        self.view.addSubview(city)
    }
}


//MARK: - SecondVC Delegate
extension ViewController: SecondVCDelegte {
    func getData(data: WeatherData) {
        dataDelegate = data
        
        DispatchQueue.main.async {
            self.city.cityLabel.text = self.dataDelegate.request.query
            self.city.temperatureLabel.text = String(self.dataDelegate.current.temperature).replacingOccurrences(of: " ", with: "U+0024")
            self.city.descriptions.text = self.dataDelegate.current.weatherDescriptions[0]
           
        }
    }
}

