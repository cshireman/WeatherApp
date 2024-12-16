//
//  Condition.swift
//  WeatherApp
//
//  Created by Chris Shireman on 12/15/24.
//

import Foundation

struct Condition: Codable {
    let text: String
    let icon: String
    let code: Int32
}
