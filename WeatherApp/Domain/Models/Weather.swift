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
    let feelslikeC: Double
    let feelslikeF: Double
    let uv: Double
}
