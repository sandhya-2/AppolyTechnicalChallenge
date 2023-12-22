//
//  MockNetworkManager.swift
//  AppolyTechnicalChallengeTests
//
//  Created by Sandhya on 22/12/2023.
//

import Foundation
@testable import AppolyTechnicalChallenge

class MockNetworkManager {
//    TODO 
    func getDataFromAPI(for type: String, house: String? = nil) async throws -> Data {
        var resourceName: String
        
        switch type {
        case "characters", "students", "staff":
            resourceName = "Characters"
        case "house":
            if let house = house {
                resourceName = "House"
            } else {
                throw NetworkError.invalidURL
            }
        default:
            throw NetworkError.invalidURL
        }
        
        guard let path = Bundle.main.url(forResource: resourceName, withExtension: "json"),
              let data = try? Data(contentsOf: path) else {
            throw NetworkError.dataNotFound
        }
        
        return data
    }

}
