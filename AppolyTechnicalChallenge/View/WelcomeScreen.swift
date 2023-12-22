//
//  WelcomeScreen.swift
//  AppolyTechnicalChallenge
//
//  Created by Sandhya on 21/12/2023.
//

import SwiftUI

struct WelcomeScreen: View {
    
    var body: some View {
        ZStack {
            Image("background")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .edgesIgnoringSafeArea(.all)

            VStack {
                Text("Welcome to Harry Potter Characters")
                    .foregroundColor(.white)
                    .font(.largeTitle)
                    .padding(50)

                NavigationLink(destination: MenuScreenView()) {
                    Text("Click me")
                        .frame(width: 200,
                        height: 50,
                        alignment: .center)
                        .font(.title)
                        .foregroundColor(.white)
                        .background(Color.indigo)
                        .cornerRadius(8)
                }
               
            }
            .padding(.top, 100)
        }

            
    }
}

#Preview {
    WelcomeScreen()
}
