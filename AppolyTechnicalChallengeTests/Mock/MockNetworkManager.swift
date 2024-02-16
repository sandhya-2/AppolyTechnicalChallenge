//
//  MockNetworkManager.swift
//  AppolyTechnicalChallengeTests
//
//  Created by Sandhya on 22/12/2023.
//

import Foundation
@testable import AppolyTechnicalChallenge

/*MockNetworkManager that behaves like NetworkManager for testing ViewModel*/
class MockNetworkManager: Networkable {
    
    func get(url: URL) async throws -> Data {
        do {
            let bundle = Bundle(for: MockNetworkManager.self)
            guard let resourcePath = bundle.url(forResource: url.absoluteString, withExtension: "json") else
            {
                throw NetworkError.invalidURL            }
            let data = try Data(contentsOf: resourcePath)
            return data
        } catch {
            throw NetworkError.dataNotFound
        }
    }
}

