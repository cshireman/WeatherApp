//
//  GetWeatherUseCase.swift
//  WeatherApp
//
//  Created by Chris Shireman on 12/15/24.
//

import Foundation

protocol SearchUseCaseProtocol {
    func execute(query: String) async throws -> [Location]
}

class SearchUseCase: SearchUseCaseProtocol {
    @Injected(\.weatherRepository) var repository: WeatherRepositoryProtocol

    func execute(query: String) async throws -> [Location] {
        return try await repository.searchLocation(query: query)
    }
}
