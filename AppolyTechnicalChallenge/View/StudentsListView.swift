//
//  StudentsListView.swift
//  AppolyTechnicalChallenge
//
//  Created by Sandhya on 21/12/2023.
//

import SwiftUI

struct StudentsListView: View {
    
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
                        await viewModel.getAllCharacters(for: .students)
                    }
                }.navigationTitle("Students List")
            }
        }
        
    
}

#Preview {
    StudentsListView()
}
