//
//  CustomCellView.swift
//  AppolyTechnicalChallenge
//
//  Created by Sandhya on 22/12/2023.
//

import SwiftUI

struct CustomCellView: View {
    let character: CharacterResponse
    var body: some View {
        HStack{
            
            AsyncImage(url: URL(string: character.image)) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .padding(10)
                    .cornerRadius(10)
            } placeholder: {
                ProgressView()
            }
            .frame(width: 50, height: 50)
            .cornerRadius(10)
            Text(character.name)
        }
        .padding(8)
    }
}


//#Preview {
//    CustomCellView(character: CharacterResponse(name: "Hermione Granger", image: "https://ik.imagekit.io/hpapi/hermione.jpeg"))
//}
