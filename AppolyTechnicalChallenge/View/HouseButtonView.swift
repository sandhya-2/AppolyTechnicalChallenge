//
//  HouseButtonView.swift
//  AppolyTechnicalChallenge
//
//  Created by Sandhya on 22/12/2023.
//

import SwiftUI

struct HouseButtonView: View {
    let optionName: String
     
    var houseOptions = [
        HouseOption(name: "Gryffindor"),
        HouseOption(name: "Hufflepuff"),
        HouseOption(name: "Ravenclaw"),
        HouseOption(name: "Slytherin")

    ]
    
//    Navigates to List view when the button is clicked
    var body: some View {
        NavigationLink {
            if optionName == "Gryffindor" {
                GryffindorView()
            } else if optionName == "Hufflepuff" {
                HufflepuffView()
            } else if optionName == "Ravenclaw" {
                RavenclawView()
            } else if optionName == "Slytherin" {
                SlytherinView()
            } else {
                Text("Invalid Choice!")
            }
        } label: {
            VStack {
                Text(optionName)
                    .fontWeight(.bold)
                    .foregroundColor(.indigo)
                    .font(.system(size: 20))
                    .fontDesign(.rounded)
                    .padding(.top, 10)
                
            }
            .frame(width: 150, height: 250)
            .background(Color.white)
            .foregroundColor(.white)
            .cornerRadius(10)
            .shadow(color: Color(white: 0.8), radius: 5, x: 0, y: 2)
            .padding(.top, 20)
        }

    }
}

#Preview {
    HouseButtonView(optionName: "Gryffindor")
}
