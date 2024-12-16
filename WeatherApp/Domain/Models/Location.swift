//
//  Location.swift
//  WeatherApp
//
//  Created by Chris Shireman on 12/15/24.
//

import Foundation

struct Location: Codable {
    let id: Int32
    let name: String
    let region: String
    let country: String
}
