//
//  Endpoint.swift
//  WeatherApp
//
//  Created by Chris Shireman on 12/15/24.
//
import Foundation

struct Endpoint {
    let path: String
    let queryItems: [URLQueryItem]

    var url: URL? {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "api.weatherapi.com"
        components.path = "/v1\(path)"
        components.queryItems = queryItems
        return components.url
    }
}
