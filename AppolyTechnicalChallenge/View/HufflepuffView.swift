//
//  HufflepuffView.swift
//  AppolyTechnicalChallenge
//
//  Created by Sandhya on 22/12/2023.
//

import SwiftUI

struct HufflepuffView: View {
    @StateObject var viewModel: CharacterViewModel = CharacterViewModel(networkManager: NetworkManager())
    
    var body: some View {
        
            VStack {
                List(viewModel.characters, id: \.id){ item in
                    NavigationLink(destination: DetailView(character: item)) {
                        CustomCellView(character: item)
                            .font(.subheadline)
                    }
                }.onAppear {
                    Task {
                        await viewModel.getHouse(house: "Hufflepuff")
                    }
                }.navigationTitle("Hufflepuff")
            }
        }
        
    
}

#Preview {
    HufflepuffView()
}
