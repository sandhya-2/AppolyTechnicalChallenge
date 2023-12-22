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

    init(networkManager: NetworkManager) {
        self.networkManager = networkManager
    }
    
    func getAllCharacters(for endpoint: APIEndpoints) async {
        do {
            let characterData = try await networkManager.getDataFromAPI(for: endpoint.rawValue)
            let results = try JSONDecoder().decode([CharacterResponse].self, from: characterData)
            let sortedResult = results.sorted { $0.name < $1.name }
            DispatchQueue.main.async {
                self.characters = sortedResult
                print("Characters fetched for endpoint: \(endpoint.rawValue)")
                print(self.characters)
            }
        } catch let error {
            print("Error occurred:", error.localizedDescription)
        }
    }
    
    
    //    Characters by house(Gryffindor, Hufflepuff, Ravenclaw, Slytherin)
    func getHouse(house: String) async {
        
        do {
            let characterData = try await networkManager.getDataFromAPI(for: "house", house: house)
            
            let results = try JSONDecoder().decode([CharacterResponse].self, from: characterData)
            let sortedResult = results.sorted { $0.name < $1.name }
            DispatchQueue.main.async {
                self.characters = sortedResult
                print("House Characters")
                print(self.characters)
            }
            
        } catch let error{
            print("Error occurred:" , error.localizedDescription)
        }
    }
    
    
}
