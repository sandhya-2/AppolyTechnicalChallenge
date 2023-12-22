//
//  DetailView.swift
//  AppolyTechnicalChallenge
//
//  Created by Sandhya on 22/12/2023.
//

import SwiftUI

struct DetailView: View {
    let character: CharacterResponse
    
    var body: some View {
        VStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/){
            AsyncImage(url: URL(string: character.image)) { phase in
                switch phase {
                case .empty:
                    Color.gray.frame(width: 220, height: 220)
                        .padding(10)
                        .cornerRadius(10)
                case .success(let image):
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width:220,height: 220)
                        .padding(10)
                        .cornerRadius(10)
                case .failure(_):
                    Color.red
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 220,height: 200)
                        .padding(10)
                        .cornerRadius(10)
                default:
                    Color.gray
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 220,height: 220)
                        .padding(10)
                        .cornerRadius(10)
                }
            }
            .padding(20)
            Text("Name: \(character.name)")
                .padding()
            Text("Eye Color: \(character.eyeColour.rawValue)")
                .padding()
            Text("Actor: \(character.actor)")
                .padding()
            Text("House: \(character.house.rawValue)")
                .padding()
            Text("Species: \(character.species.rawValue)")
        }.padding()
        
       
    }
}

//#Preview {
//    DetailView(character: )
//}


