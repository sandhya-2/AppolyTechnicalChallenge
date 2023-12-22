//
//  MenuScreenView.swift
//  AppolyTechnicalChallenge
//
//  Created by Sandhya on 21/12/2023.
//

import SwiftUI

struct Option: Identifiable {
    let id = UUID()
    var name: String
    var image: String
}

// These are the four options used on the Menu
var menuOptions = [
    Option(name: "All Characters", image: "characterLogo"),
    Option(name: "Students", image: "studentLogo"),
    Option(name: "Staff", image: "staffLogo"),
    Option(name: "House", image: "houseLogo")

]

// MenuScreen displaying the four buttons
struct MenuScreenView: View {
    var body: some View {
        LazyVGrid(
           columns: [
               GridItem(.flexible()), GridItem(.flexible()),
           ],
           alignment: .center,
           spacing: 10,
           pinnedViews: [],
           content: {
               ForEach (menuOptions) { option in
                   OptionButtonView(
                    optionName: option.name,
                    optionImage: option.image
                )
               }
           })
        .padding(15)
        .navigationTitle("Menu")
        .font(.title)
        
    }
}

#Preview {
    MenuScreenView()
}
