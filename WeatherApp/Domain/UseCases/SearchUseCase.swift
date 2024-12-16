//
//  GetWeatherUseCase.swift
//  WeatherApp
//
//  Created by Chris Shireman on 12/15/24.
//

import Foundation

protocol SearchUseCaseProtocol {
    func execute(query: String) async throws -> WeatherResponse
}

class SearchUseCase: SearchUseCaseProtocol {
    @Injected(\.weatherRepository) var repository: WeatherRepositoryProtocol

    func execute(query: String) async throws -> WeatherResponse {
        return try await repository.searchLocation(query: query)
    }
}
