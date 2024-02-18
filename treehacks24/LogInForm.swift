//
//  LogInForm.swift
//  treehacks24
//
//  Created by Alicia Bao on 2/17/24.
//

import SwiftUI

struct LogInForm: View {
    @State var username: String = ""
    @State var password: String = ""
    var body: some View {
        NavigationView{
            VStack{
                InputFieldView(data: $username, title: "Username")
                InputFieldView(data: $password, title: "Password")
                NavigationLink(destination: TabViewExample()){
                    Text("Log In")
                }
            }
        }
        
    }
}

#Preview {
    LogInForm()
}
