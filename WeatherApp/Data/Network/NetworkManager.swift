//
//  NetworkManager.swift
//  WeatherApp
//
//  Created by Chris Shireman on 12/15/24.
//

import Foundation

protocol NetworkManagerProtocol {
    func fetch<T: Decodable>(endpoint: Endpoint) async throws -> T
}

class NetworkManager: NetworkManagerProtocol {
    private let urlSession: URLSession

    init(urlSession: URLSession = .shared) {
        self.urlSession = urlSession
    }

    func fetch<T: Decodable>(endpoint: Endpoint) async throws -> T {
        guard let url = endpoint.url else { throw URLError(.badURL) }

        let (data, response) = try await urlSession.data(from: url)
        guard let httpResponse = response as? HTTPURLResponse else {
            throw URLError(.badServerResponse)
        }
                
        guard httpResponse.statusCode == 200 else {
            if let error = parseWeatherAPIError(data: data) {
                throw error
            }
                
            throw URLError(.badServerResponse)
        }

        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return try decoder.decode(T.self, from: data)
    }
    
    private func parseWeatherAPIError(data: Data) -> WeatherAPIError? {
        let error = try? JSONDecoder().decode(WeatherAPIError.self, from: data)
    }
}

private struct NetworkManagerKey: InjectionKey {
    static var currentValue: NetworkManagerProtocol = NetworkManager()
}

extension InjectedValues {
    var networkManager: NetworkManagerProtocol {
        get { Self[NetworkManagerKey.self] }
        set { Self[NetworkManagerKey.self] = newValue }
    }
}
