//
//  browse.swift
//  treehacks24
//
//  Created by Alicia Bao on 2/17/24.
//

import SwiftUI

struct browse: View {
    var body: some View {
        ZStack{
            Color(red: 0.2980392156862745, green: 0.33725490196078434, blue: 0.2235294117647059).edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                VStack{
                    Text("Browse Trips")
                        .font(.largeTitle
                            .weight(.bold))
                        .foregroundStyle(Color(red: 1, green: 0.9725490196078431, blue: 0.9098039215686274))
                    VStack{
                        HStack{
                            Text("Costco")
                                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                            Spacer()
                            Text("Alicia, 5:00 PM")
                        }
                        .padding()
                    HStack{
                        Text("3 items available from your list")
                            .frame(alignment: .leading)
                    }
                    HStack{
                        Text("See full trip details")
                            .padding(10)
                            .background(Color(red: 0.2980392156862745, green: 0.33725490196078434, blue: 0.2235294117647059))
                            .foregroundColor(Color(red: 1, green: 0.9725490196078431, blue: 0.9098039215686274))
                        Spacer()
                        Button(action: {}){
                        Text("Join Cart")
                                .padding(10)
                        }
                        .background(Color(red: 0.2980392156862745, green: 0.33725490196078434, blue: 0.2235294117647059))
                        .accentColor(Color(red: 1, green: 0.9725490196078431, blue: 0.9098039215686274))
                    }.padding()
                    }
                    .background(Color(red: 1, green: 0.9725490196078431, blue: 0.9098039215686274))
                    .frame(maxWidth:300)
                    .cornerRadius(15)
                    Spacer()
                }
        }
    }
}
                         
struct browse_Previews: PreviewProvider {
    static var previews: some View {
        browse()
    }
}

