//
//  WeatherAPIError.swift
//  WeatherApp
//
//  Created by Chris Shireman on 12/15/24.
//

import Foundation

struct WeatherAPIError: Error, Codable {
    let code: WeatherAPIErrorCode
    let message: String
}

enum WeatherAPIErrorCode: Int32, Codable {
    case apiKeyNotProvided = 1002
    case parameterQNotProvided = 1003
    case apiRequestURLInvalid = 1005
    case noLocationFound = 1006
    case invalidAPIKey = 2006
    case apiKeyQuotaExceeded = 2007
    case apiKeyDisabled = 2008
    case apiKeyNotAuthorized = 2009
    case jsonBodyInvalid = 9000
    case jsonBodyTooLarge = 9001
    case internalError = 9999
}
