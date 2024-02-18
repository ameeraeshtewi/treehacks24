//
//  ContentView.swift
//  treehacks24
//
//  Created by Ameera Eshtewi on 2/17/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(content: {
            Text("Name of App")
            NavigationView {
                VStack{
                    NavigationLink(destination: SignUpForm()){
                        Text("Create a Profile")
                    }
                    NavigationLink(destination: LogInForm()){
                        Text("Log In")
                    }
                }
                
            }
            
        })
    }
}

#Preview {
    ContentView()
}
