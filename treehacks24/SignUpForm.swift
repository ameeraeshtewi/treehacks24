//
//  SignUpForm.swift
//  treehacks24
//
//  Created by Alicia Bao on 2/17/24.
//

import SwiftUI

struct SignUpForm: View {
    @State var username: String = ""
    @State var password: String = ""
    @State var name: String = ""
    @State var location: String = ""
    @State var venmo: String = ""
    @State var bio: String = ""
    
    var body: some View {
        NavigationView{
            ZStack{
                Color(red: 1, green: 0.9725490196078431, blue: 0.9098039215686274).edgesIgnoringSafeArea(.all)
                VStack{
                    Text("Profile")
                        .font(.largeTitle
                            .weight(.bold))
                        .foregroundStyle(Color(red: 0.2980392156862745, green: 0.33725490196078434, blue: 0.2235294117647059))
                    InputFieldView(data: $username, title: "Username")
                        .padding()
                    SecureField("Password", text: $password)
                        .padding(.leading, 35)
                        .frame(height: 80)
                        .overlay(
                            RoundedRectangle(cornerSize: CGSize(width: 4, height: 4))
                                .stroke(Color.gray, lineWidth: 1)
                                .padding()
                        )
                    InputFieldView(data: $name, title: "Name")
                        .padding()
                    InputFieldView(data: $location, title: "Location")
                        .padding()
                    InputFieldView(data: $venmo, title: "Venmo")
                        .padding()
                    InputFieldView(data: $bio, title: "Bio") 
                        .padding()
                    NavigationLink(destination: LogInForm()){
                        Text("Create New Profile")
                            .padding()
                    }
                    .background(Color(red: 0.2980392156862745, green: 0.33725490196078434, blue: 0.2235294117647059))
                    .cornerRadius(15)
                    .frame(width: 200, height: 75)
                    .accentColor(Color(red: 1, green: 0.9725490196078431, blue: 0.9098039215686274))
                    
                    
                }
            }
        }
    }
}

struct SignUpForm_Previews: PreviewProvider {
    static var previews: some View {
        SignUpForm()
    }
}
