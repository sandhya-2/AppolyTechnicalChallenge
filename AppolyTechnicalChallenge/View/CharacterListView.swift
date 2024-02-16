//
//  CharacterListView.swift
//  AppolyTechnicalChallenge
//
//  Created by Sandhya on 21/12/2023.
//

import SwiftUI

struct CharacterListView: View {
    
    @StateObject var viewModel: CharacterViewModel = CharacterViewModel(networkManager: NetworkManager())
    
    var body: some View {
        
        NavigationStack {
            VStack (alignment: .leading){
                List {
                    ForEach(viewModel.filteredCharacters) { character in
                        NavigationLink(destination: DetailView(character: character)) {
                            CustomCellView(character: character)
                                .font(.subheadline)
                        }
                    }
                }
                .navigationTitle("All Characters")
                .searchable(text: $viewModel.searchText)
                .task {
                    await viewModel.getAllCharacters(for: .allCharacters)
                }
                
            }
            
        }
        
    }
    
}

#Preview {
    CharacterListView()
}
