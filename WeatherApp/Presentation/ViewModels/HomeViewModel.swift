//
//  HomeViewModel.swift
//  WeatherApp
//
//  Created by Chris Shireman on 12/15/24.
//

import SwiftUI

@MainActor
class HomeViewModel: ObservableObject {
    @AppStorage("locationID") var currentLocationID: Int?
    
    internal var searchUseCase: SearchUseCaseProtocol = SearchUseCase()
    internal var getWeatherUseCase: GetWeatherUseCaseProtocol = GetWeatherUserCase()
    
    @Published var weather: Weather?
    @Published var location: Location?
    @Published var isLoading: Bool = false
    
    func search(query: String) async {
        do {
            let response = try await searchUseCase.execute(query: query)
            weather = response.current
            location = response.location
        } catch {
            print("Error searching: \(error)")
        }
    }
    
    func fetchWeather() async {
        guard let currentLocationID else {
            print("No location ID to get")
            return
        }
        
        do {
            let response = try await getWeatherUseCase.execute(locationId: Int32(currentLocationID))
            weather = response.current
            location = response.location
        } catch {
            print("Error getting current conditions: \(error)")
        }

    }
    
}
