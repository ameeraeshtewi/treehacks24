//
//  browse.swift
//  treehacks24
//
//  Created by Alicia Bao on 2/17/24.
//

import SwiftUI

struct browse: View {
    @State private var detailedView = false
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
                        Button(action:{
                            detailedView = true
                        }){
                            Text("See full trip details")
                        }
                            .padding(10)
                            .background(Color(red: 0.2980392156862745, green: 0.33725490196078434, blue: 0.2235294117647059))
                            .foregroundColor(Color(red: 1, green: 0.9725490196078431, blue: 0.9098039215686274))
                            .popover(isPresented:$detailedView){
                                ZStack{
                                    Color(red: 1, green: 0.9725490196078431, blue: 0.9098039215686274)
                                    VStack{
                                        HStack{
                                            Button(action:{
                                                detailedView = false
                                            }){
//                                               Image("exit")
                                            }
                                            Spacer()
                                            
                                        }
                                        Text("Alicia’s Trip to Trader Joes")
                                            .font(.largeTitle
                                                .weight(.bold))
                                        Text("Your Items")
                                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                                            .padding(.top, 10)
                                        Text("Bananas")
                                        Text("Oranges")
                                        Text("Belvita crackers")
                                        Text("Pickup Location")
                                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                                            .padding(.top, 10)
                                        Text("McIver Residence Hall 103 Raleigh St. Chapel Hill, NC 27514")
                                            .frame(maxWidth: 250)
                                        Text("Pickup Time")
                                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                                            .padding(.top, 10)
                                        Text("Today at 5:00 pm")
                                        Spacer()
                                    }.padding()
                                        .foregroundStyle(Color(red: 0.2980392156862745, green: 0.33725490196078434, blue: 0.2235294117647059))
                                }
                            }
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

