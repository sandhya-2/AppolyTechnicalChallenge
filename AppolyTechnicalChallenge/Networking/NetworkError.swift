//
//  NetworkError.swift
//  AppolyTechnicalChallenge
//
//  Created by Sandhya on 21/12/2023.
//

import Foundation

enum NetworkError: Error {
    case invalidURL
    case parsingError
    case dataNotFound
}

extension NetworkError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .invalidURL:
            return NSLocalizedString("Invalid URL", comment: "invalidURL")
        case .parsingError:
            return NSLocalizedString("Encountered Parsing Error", comment: "parsingError")
        case .dataNotFound:
            return NSLocalizedString("Failed to get data from API", comment: "dataNotFound")
        }
    }
}
