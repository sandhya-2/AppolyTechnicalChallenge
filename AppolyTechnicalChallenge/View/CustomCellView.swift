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

        HStack {
            
            ImageView(character: character)
                .frame(width: 60, height: 60)
                .cornerRadius(10)
                .padding(.trailing, 10)
               
            
            Text(character.name)
                .padding(5)
        }
        
    }
}


//#Preview {
//    CustomCellView(character: CharacterResponse(name: "Hermione Granger", image: "https://ik.imagekit.io/hpapi/hermione.jpeg"))
//}
