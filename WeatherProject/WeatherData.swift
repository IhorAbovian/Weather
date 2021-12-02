//
//  WeatherData.swift
//  WeatherProject
//
//  Created by Igor Abovyan on 24.11.2021.
//

import Foundation

// MARK: - Weather data
struct WeatherData: Codable {
    let request: Request
    let current: Current
}

// MARK: - Current
struct Current: Codable {

    let temperature: Int
    let weatherDescriptions: [String]

    enum CodingKeys: String, CodingKey {
        case temperature
        case weatherDescriptions = "weather_descriptions"
    }
}

// MARK: - Request
struct Request: Codable {
    let query: String
}


