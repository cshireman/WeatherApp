//
//  SearchResultViewModel.swift
//  WeatherApp
//
//  Created by Chris Shireman on 12/16/24.
//

import SwiftUI

@MainActor
class SearchResultViewModel: ObservableObject {
    @Published var location: Location
    @Published var weather: Weather?
    
    var name: String {
        return location.name
    }
    
    var temp: String = "-"
    var iconURL: URL?
    
    @Injected(\.weatherRepository) var weatherRepository: WeatherRepositoryProtocol
    
    init(location: Location) {
        self.location = location
        Task {
            if let locationId = location.id {
                do {
                    let response = try await weatherRepository.getWeather(for: locationId)
                    let weather = response.current
                    self.weather = weather
                    temp = "\(Int(weather.tempF))°"
                    iconURL = URL(string: "https:\(weather.condition.icon)")
                } catch {
                    print(error)
                    self.temp = "-°"
                    iconURL = nil
                }
            }
        }
    }
}
