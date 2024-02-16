//
//  CharacterViewModel.swift
//  AppolyTechnicalChallenge
//
//  Created by Sandhya on 21/12/2023.
//

import Foundation

class CharacterViewModel: ObservableObject {
    var networkManager = NetworkManager()
    @Published var characters: [CharacterResponse] = []
    @Published var searchText: String = ""
    
    init(networkManager: NetworkManager) {
        self.networkManager = networkManager
    }
    
    /* search bar using computed property */
    var filteredCharacters: [CharacterResponse] {
        if searchText.isEmpty {
            return characters
        } else {
            return characters
                .filter { $0.name.localizedCaseInsensitiveContains(searchText) }
        }
    }
    
    func getDataFromAPI(for type: String, house: String?) async throws -> Data {
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
            let data = try await networkManager.get(url: url)
            
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
    
    func getAllCharacters(for endpoint: APIEndpoints) async {
        do {
            let characterData = try await getDataFromAPI(for: endpoint.rawValue, house: "")
            let results = try JSONDecoder().decode([CharacterResponse].self, from: characterData)
            let sortedResult = results.sorted { $0.name < $1.name }
            DispatchQueue.main.async {
                self.characters = sortedResult
                print("Characters fetched for endpoint: \(endpoint.rawValue)")
//                print(self.characters)
            }
        } catch let error {
            print("Error occurred:", error.localizedDescription)
        }
    }
    
    //    Characters by house(Gryffindor, Hufflepuff, Ravenclaw, Slytherin)
    func getHouse(house: String) async {
        
        do {
            let characterData = try await getDataFromAPI(for: "house", house: house)
            
            let results = try JSONDecoder().decode([CharacterResponse].self, from: characterData)
            let sortedResult = results.sorted { $0.name < $1.name }
            DispatchQueue.main.async {
                self.characters = sortedResult
                print("House Characters")
                //                print(self.characters)
            }
            
        } catch let error{
            print("Error occurred:" , error.localizedDescription)
        }
    }
    
}
