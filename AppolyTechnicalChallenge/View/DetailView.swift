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
        ScrollView {
            VStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/){

                ImageView(character: character)
                    .cornerRadius(10)
                    .padding(20)
                Text("Name: \(character.name)")
                    .padding()
                Text("HogwartsStaff: \(character.hogwartsStaff.description)")
                    .padding()
                Text("hogwartsStudent: \(character.hogwartsStudent.description)")
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
}


//#Preview {
//    DetailView(character: )
//}


