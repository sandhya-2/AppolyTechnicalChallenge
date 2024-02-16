//
//  NetworkManager.swift
//  AppolyTechnicalChallenge
//
//  Created by Sandhya on 21/12/2023.
//

import Foundation

protocol Networkable {
    func get(url: URL) async throws -> Data
}

struct NetworkManager {
    let urlSession: Networking
    init(urlSession: Networking = URLSession.shared) {
        self.urlSession = urlSession
    }
}

extension NetworkManager: Networkable {
    func get(url: URL) async throws -> Data {
        do {
            let (data, _) = try await  urlSession.data(from: url)
            return data
        } catch {
            throw NetworkError.dataNotFound
        }
    }
        
}
