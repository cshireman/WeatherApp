//
//  GetWeatherUseCase.swift
//  WeatherApp
//
//  Created by Chris Shireman on 12/15/24.
//

import Foundation

protocol GetWeatherUseCaseProtocol {
    func execute(locationId: Int32) async throws -> WeatherResponse
}

class GetWeatherUserCase: GetWeatherUseCaseProtocol {
    @Injected(\.weatherRepository) var repository: WeatherRepositoryProtocol

    func execute(locationId: Int32) async throws -> WeatherResponse {
        return try await repository.getWeather(for: locationId)
    }
}
