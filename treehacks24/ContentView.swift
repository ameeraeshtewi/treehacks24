//
//  ContentView.swift
//  treehacks24
//
//  Created by Ameera Eshtewi on 2/17/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            ZStack{
                Color(red: 1, green: 0.9725490196078431, blue: 0.9098039215686274).edgesIgnoringSafeArea(.all)
                VStack{
                    Text("Name of App")
                        .font(.largeTitle
                            .weight(.bold))
                        .foregroundStyle(Color(red: 0.2980392156862745, green: 0.33725490196078434, blue: 0.2235294117647059))
                    NavigationLink(destination: SignUpForm()){
                        Text("Create a Profile")
                            .padding()
                    }
                    .frame(maxWidth: 200)
                    .background(Color(red: 0.2980392156862745, green: 0.33725490196078434, blue: 0.2235294117647059))
                    NavigationLink(destination: LogInForm()){
                        Text("Log In")
                            .padding()
                    }
                    .frame(maxWidth: 200)
                    .background(Color(red: 0.2980392156862745, green: 0.33725490196078434, blue: 0.2235294117647059))
                }
            }
        }
            .accentColor(Color(red: 1, green: 0.9725490196078431, blue: 0.9098039215686274))
    }
}

#Preview {
    ContentView()
}
