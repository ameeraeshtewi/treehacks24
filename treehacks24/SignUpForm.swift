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
        ScrollView{
            NavigationView{
                VStack{
                    InputFieldView(data: $username, title: "Username")
                    InputFieldView(data: $password, title: "Password")
                    Form{
                        TextField("First Name Last Initial", text: $name)
                        TextField("Dorm/Location", text: $location)
                        TextField("Venmo", text: $venmo)
                        TextField("Fav grocery items?",text: $bio)
                    }
                    NavigationLink(destination: LogInForm()){
                        Text("Submit")
                    }
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
