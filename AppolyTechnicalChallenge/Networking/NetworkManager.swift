//
//  NetworkManager.swift
//  AppolyTechnicalChallenge
//
//  Created by Sandhya on 21/12/2023.
//

import Foundation

class NetworkManager {
    
    var session = URLSession.shared
    
    func getDataFromAPI(for type: String, house: String? = nil) async throws -> Data {
        let url_String: URL
        
        // Check the case when house parameter is added or not for the given type
        switch type {
        case "characters", "students", "staff":
            url_String = buildURLForType(type)
        case "house":
            if let house = house {
                url_String = buildURLForType(type, house: house)
            } else {
                throw NetworkError.invalidURL
            }
        default:
            throw NetworkError.invalidURL
        }
        
        guard let url = URL(string: url_String.absoluteString) else {
            throw NetworkError.invalidURL
        }
        
        do {
            let (data, response) = try await session.data(from: url)
            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                throw NetworkError.dataNotFound
            }
            return data
        } catch {
            throw error
        }
    }


    // This function constructs the url to retreive data based on the specified path type
    func buildURLForType(_ type: String, house: String? = nil) -> URL {
        var path = "/api/characters/"
        
        switch type {
        case "characters":
            path = "/api/characters/"
        case "students":
            path += "students"
        case "staff":
            path += "staff"
        case "house":
            if let house = house {
                path += "house/\(house.lowercased())"
            } else {
                preconditionFailure("House parameter is required for 'house' type")
            }
        default:
            preconditionFailure("Invalid type")
        }
        
        var components = URLComponents()
        components.scheme = "https"
        components.host = "hp-api.onrender.com"
        components.path = path
        
        guard let url = components.url else {
            preconditionFailure("Invalid URL components")
        }
        return url
    }

}
