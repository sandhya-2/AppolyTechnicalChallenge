//
//  OptionButtonView.swift
//  AppolyTechnicalChallenge
//
//  Created by Sandhya on 21/12/2023.
//

import SwiftUI

struct OptionButtonView: View {
    
    let optionName: String
    let optionImage: String
     
    var menuOptions = [
        Option(name: "All Characters", image: "characterLogo"),
        Option(name: "Students", image: "studentLogo"),
        Option(name: "Staff", image: "staffLogo"),
        Option(name: "House", image: "houseLogo")

    ]
    
//    Navigates to List view when the button is clicked 
    var body: some View {
        NavigationLink {
            if optionName == "All Characters" {
                CharacterListView()
            } else if optionName == "Students" {
                StudentsListView()
            } else if optionName == "Staff" {
                StaffListView()
            } else if optionName == "House" {
                HouseScreen()
            } else {
                Text("Invalid Choice!")
            }
        } label: {
            VStack {
                Image(optionImage)
                    .resizable()
                    .frame(width: 50, height: 50, alignment: .trailing)
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
    OptionButtonView(optionName: "Students", optionImage: "studentLogo")
}
