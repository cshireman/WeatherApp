//
//  WeatherRepository.swift
//  WeatherApp
//
//  Created by Chris Shireman on 12/15/24.
//

import Foundation

protocol WeatherRepositoryProtocol {
    func searchLocation(query: String) async throws -> WeatherResponse
    func getWeather(for locationId: Int32) async throws -> WeatherResponse
}

class WeatherRepository: WeatherRepositoryProtocol {
    @Injected(\.networkManager) var networkManager: NetworkManagerProtocol
    private let apiKey = "abb89727897c46db957150046212312"

    func searchLocation(query: String) async throws -> WeatherResponse {
        let endpoint = Endpoint(
            path: "/current.json",
            queryItems: [URLQueryItem(name: "key", value: apiKey),
                         URLQueryItem(name: "q", value: query)]
        )
        return try await networkManager.fetch(endpoint: endpoint)
    }

    func getWeather(for locationId: Int32) async throws -> WeatherResponse {
        let endpoint = Endpoint(
            path: "/current.json",
            queryItems: [URLQueryItem(name: "key", value: apiKey),
                         URLQueryItem(name: "q", value: "id:\(locationId)")]
        )
        return try await networkManager.fetch(endpoint: endpoint)
    }
}

private struct WeatherRepositoryKey: InjectionKey {
    static var currentValue: WeatherRepositoryProtocol = WeatherRepository()
}

extension InjectedValues {
    var weatherRepository: WeatherRepositoryProtocol {
        get { Self[WeatherRepositoryKey.self] }
        set { Self[WeatherRepositoryKey.self] = newValue }
    }
}
