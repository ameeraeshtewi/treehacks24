//
//  TabView.swift
//  treehacks24
//
//  Created by Alicia Bao on 2/17/24.
//

import SwiftUI

struct TabViewExample: View {
    init() {
    UITabBar.appearance().backgroundColor = UIColor(Color(red: 0.2980392156862745, green: 0.33725490196078434, blue: 0.2235294117647059)
)
    }
    var body: some View {
        TabView() {
            groceryList()
                .tabItem {
                    Text("Your List")
                    Image("list")
                }
//            browseTrips()
//                .tabItem {
//                    Text("")
//                    Image("map")
//                }
//            activity()
//                .tabItem {
//                    Text("Activity")
//                    Image(systemName: "receipt")
//                }
//            profile()
//                .tabItem {
//                    Text("Profile")
//                    Image(systemName: "profile")
//                }
        }
        .accentColor(Color(red: 1, green: 0.9725490196078431, blue: 0.9098039215686274))
    }
}

struct TabViewExample_Previews: PreviewProvider {
    static var previews: some View {
        TabViewExample()
    }
}
