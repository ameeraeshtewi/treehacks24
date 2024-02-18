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
                ZStack{
                    Color(red: 1, green: 0.9725490196078431, blue: 0.9098039215686274).edgesIgnoringSafeArea(.all)
                    VStack{
                        Text("Log In")
                            .font(.largeTitle
                                .weight(.bold))
                            .foregroundStyle(Color(red: 0.2980392156862745, green: 0.33725490196078434, blue: 0.2235294117647059))
                        InputFieldView(data: $username, title: "Username")
                            .padding()
                        InputFieldView(data: $password, title: "Password")
                            .padding()
                        NavigationLink(destination: TabViewExample(username: username)){
                            Text("Log In")
                                .padding()
                        }
                        .background(Color(red: 0.2980392156862745, green: 0.33725490196078434, blue: 0.2235294117647059))
                        .cornerRadius(15)
                        .frame(width: 200, height: 75)
                        .accentColor(Color(red: 1, green: 0.9725490196078431, blue: 0.9098039215686274))
                    }
                }
                .background(Color(red: 1, green: 0.9725490196078431, blue: 0.9098039215686274)).edgesIgnoringSafeArea(.all)
                .accentColor(Color(red: 0.2980392156862745, green: 0.33725490196078434, blue: 0.2235294117647059))
            }
        
    }
}

struct LogIn_Previews: PreviewProvider {
    static var previews: some View {
        LogInForm()
    }
}
