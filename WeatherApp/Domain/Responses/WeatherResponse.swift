//
//  CurrentResponse.swift
//  WeatherApp
//
//  Created by Chris Shireman on 12/15/24.
//

import Foundation

struct WeatherResponse: Codable {
    let location: Location
    let current: Weather
}
