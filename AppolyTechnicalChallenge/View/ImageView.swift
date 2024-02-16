//
//  ImageView.swift
//  AppolyTechnicalChallenge
//
//  Created by Sandhya on 27/12/2023.
//

import SwiftUI

struct ImageView: View {
    let character: CharacterResponse
    
    var body: some View {
        if let url = URL(string: character.image) {
            CacheAsyncImage(url: url) { phase in
                switch phase {
                    case .success(let image):
                        VStack {
                            image
                                .resizable()
                                .clipped()
                                .aspectRatio(contentMode: .fill)
                                .padding(.trailing, 5)
                                .frame(maxWidth: .infinity)
                        }
                    case .failure(let error):
                        EmptyView()
                        // Handle image loading failure
                    case .empty:
                        HStack {
                            ProgressView()
                                .progressViewStyle(CircularProgressViewStyle(tint: .red))
                            Spacer()
                        }
                    @unknown default:
                        // Handle unknown state
                        Image(systemName: "questionmark")
                }
            }
            .frame(maxWidth: 180)
            .padding()
        } else {
            // Handle case when URL from character.image is invalid
//            Text("Invalid URL")
//                .foregroundColor(.red)
            Image("noImage")
                .resizable()
                .aspectRatio(contentMode: .fit)
        }
    }
}


//#Preview {
//  ImageView(character: CharacterResponse(id: "", name: <#T##String#>, alternateNames: [], species: "", gender: "", house: <#T##House#>, dateOfBirth: <#T##String?#>, yearOfBirth: <#T##Int?#>, wizard: false, ancestry: <#T##Ancestry#>, eyeColour: "", hairColour: <#T##HairColour#>, wand: <#T##Wand#>, patronus: <#T##Patronus#>, hogwartsStudent: <#T##Bool#>, hogwartsStaff: <#T##Bool#>, actor: <#T##String#>, alternateActors: <#T##[String]#>, alive: <#T##Bool#>, image: <#T##String#>))
//}
