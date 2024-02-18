//
//  groceryList.swift
//  treehacks24
//
//  Created by Alicia Bao on 2/17/24.
//

import SwiftUI

struct groceryList: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        
        Spacer()
        // nav bar
        NavigationView{
            HStack{
                    VStack{
                        Image("list")
                        NavigationLink(destination: browseTrips()){
                            Text("Browse Trips")
                        }
                    }
                    VStack{
                        Image("map")
//                        NavigationLink(destination: browseTrips()){
//                            Text("Browse Trips")
//                        }
                    }
                    VStack{
                        Image("receipt")
                        NavigationLink(destination: activity()){
                            Text("Activity")
                        }

                    }
                    VStack{
                        Image("profile")
                        NavigationLink(destination: AccountView()){
                            Text("Profile")
                        }
                    }
                }
//                NavigationLink(destination: browseTrips()){
//                    Text("Browse Trips")
//                }
//                NavigationLink(destination: activity()){
//                    Text("Activity")
//                }
               
            }
            .background(Color(red: 0.2980392156862745, green: 0.33725490196078434, blue: 0.2235294117647059))
            .accentColor(Color(red: 1, green: 0.9725490196078431, blue: 0.9098039215686274))
        }

    }
}

#Preview {
    groceryList()
}
