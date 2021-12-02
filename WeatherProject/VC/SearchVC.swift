//
//  SearchVC.swift
//  WeatherProject
//
//  Created by Igor Abovyan on 26.11.2021.
//

import UIKit

protocol SecondVCDelegte {
    func getData(data: WeatherData)
}

class SearchVC: UIViewController {
    
    var myDelegate: SecondVCDelegte!
//    var weatherData: WeatherData!
    
}

//MARK: - Controller life cycle
extension SearchVC {
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.config()
    }
}

//MARK: - Configuration
extension SearchVC {
    private func config() {
        self.createSearchController()
    }
    
    private func createSearchController() {
        let searchController = UISearchController.init(searchResultsController: nil)
        navigationItem.searchController = searchController
        navigationController?.navigationBar.prefersLargeTitles = true
        searchController.searchBar.delegate = self
        navigationItem.title = "Search"
    }
}

//MARK: - SearchBar Delegate
extension SearchVC: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        
        let urlString = "http://api.weatherstack.com/current?access_key=b983f8c0264ab377ebc313b6d62e0b6b&query=\(searchBar.text!.replacingOccurrences(of: " ", with: "%20"))"
        
        guard let url = URL.init(string: urlString) else { return }
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print(error)
                return
            }
            guard let data = data else { return }
            
            do {
                let decoder = JSONDecoder()
                let json = try decoder.decode(WeatherData.self, from: data)
                self.myDelegate.getData(data: json)
            }catch {
                fatalError("error\(error)")
            }
        }.resume()
        
        navigationController?.popViewController(animated: true)
    }
}
