//
//  HouseScreen.swift
//  AppolyTechnicalChallenge
//
//  Created by Sandhya on 22/12/2023.
//

import SwiftUI

struct HouseOption: Identifiable {
    let id = UUID()
    var name: String
}

// These are the four options used on the House Menu

var houseOptions = [
    HouseOption(name: "Gryffindor"),
    HouseOption(name: "Hufflepuff"),
    HouseOption(name: "Ravenclaw,"),
    HouseOption(name: "Slytherin")

]

struct HouseScreen: View {
    var body: some View {
        LazyVGrid(
           columns: [
               GridItem(.flexible()), GridItem(.flexible()),
           ],
           alignment: .center,
           spacing: 10,
           pinnedViews: [],
           content: {
               ForEach (houseOptions) { option in
                   HouseButtonView(
                    optionName: option.name
                )
               }
           })
        .padding(15)
        .navigationTitle("Character By House")
        .font(.title)

    
    }
}

#Preview {
    HouseScreen()
}
