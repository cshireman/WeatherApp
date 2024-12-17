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
    @Published var searchResults: [Location] = []
    
    @Published var isError: Bool = false
    @Published var errorMessage: String = ""
    
    var name: String {
        return location?.name ?? "-"
    }
    
    var temp: String {
        if let temp = weather?.tempF {
            return "\(Int(temp))°"
        }
        
        return "-°"
    }
    
    var iconURL: URL? {
        if let icon = weather?.condition.icon {
            return URL(string: "https:\(icon)")
        }
        
        return nil
    }
    
    func search(query: String) async {
        do {
            searchResults = try await searchUseCase.execute(query: query)
        } catch {
            handleError(error)
        }
    }
    
    func fetchWeather() async {
        guard let currentLocationID else {
            print("No location ID to get")
            return
        }
        
        do {
            let response = try await getWeatherUseCase.execute(locationId: Int32(currentLocationID))
            location = response.location
            weather = response.current
        } catch {
            handleError(error)
        }
    }
    
    func selectLocation(_ location: Location) {
        guard let locationId = location.id else { return }
        currentLocationID = Int(locationId)
        searchResults = []
        Task {
            await fetchWeather()
        }
    }
    
    private func handleError(_ error: Error) {
        if let weatherError = error as? WeatherAPIError {
            errorMessage = weatherError.message
        } else {
            errorMessage = error.localizedDescription
        }
        
        isError = true
    }
    
}
