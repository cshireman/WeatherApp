//
//  Weather.swift
//  WeatherApp
//
//  Created by Chris Shireman on 12/15/24.
//

import Foundation

struct Weather: Codable {
    let tempC: Double
    let tempF: Double
    let condition: Condition
    let humidity: Double
    let feelsLikeC: Double
    let feelsLikeF: Double
    let uv: Double
}
