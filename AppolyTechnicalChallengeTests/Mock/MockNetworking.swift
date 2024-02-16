//
//  MockNetworking.swift
//  AppolyTechnicalChallengeTests
//
//  Created by Sandhya on 14/02/2024.
//

import Foundation
@testable import AppolyTechnicalChallenge

class MockNetworking: Networking {
    
    var mockData: Data!
    var mockResponse: URLResponse!
    var error: Error?
    
    func data(from url: URL, delegate: URLSessionTaskDelegate?) async throws -> (Data, URLResponse) {
        if error != nil {
            throw error!
        }
        return (mockData, mockResponse)
    }
}


