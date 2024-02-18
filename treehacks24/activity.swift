
//  activity.swift
//  treehacks24
//
//  Created by Ameera Eshtewi on 2/17/24.
//


//if there is data present, show
//if not, then under upcoming and past trips, show nothing or something
//like start a trip!
import SwiftUI

struct activity: View {
    var body: some View {
        ZStack(alignment: .center){
            Color(red: 0.2980392156862745, green: 0.33725490196078434, blue: 0.2235294117647059)
                .ignoresSafeArea()
            ScrollView(.vertical){
                VStack(alignment: .center){
                    Text("Activity")
                        .foregroundColor(Color(red: 1, green: 0.9725490196078431, blue: 0.9098039215686274))
                        .font(.system(size: 35, weight: .bold))
                        .padding(.top, 30)
                        .padding(.bottom, 10)
                    Text("32 trips started in the last month")
                        .foregroundColor(Color(red: 1, green: 0.9725490196078431, blue: 0.9098039215686274))
                        .font(.system(size: 20, weight: .bold))
                        .padding(.top, 15)
                        .multilineTextAlignment(.leading)
                    
                    VStack(alignment: .leading){
                        Text("Upcoming Trips")
                            .foregroundColor(Color(.white))
                            .font(.system(size: 20, weight: .bold))
                            .padding()
                            .padding(.top, 20)
                            .padding(.bottom, -20)
                        Grid{
                            GridRow{
                                RoundedRectangle(cornerRadius: 15)
                                    .foregroundColor(Color(red: 1, green: 0.9725490196078431, blue: 0.9098039215686274))
                                    .frame(width: 300, height: 100, alignment: .center)
                                    .padding(.bottom, 20)
                                    .padding(.leading)
                                    .padding(.trailing)
                                    .padding(.top)
                                    .overlay(overlayView)
                                
                            }
                            GridRow{
                                //                                Text("past")
                                //                                    .background(RoundedRectangle(cornerRadius:25))
                                
                            }
                        }
                        
                        VStack(alignment: .leading){
                            Text("Past Trips")
                                .foregroundColor(Color(.white))
                                .font(.system(size: 20, weight: .bold))
                                .padding()
                                .padding(.bottom, -20)

                            Grid{
                                GridRow{
                                    RoundedRectangle(cornerRadius: 15)
                                        .foregroundColor(Color(red: 1, green: 0.9725490196078431, blue: 0.9098039215686274))
                                        .frame(width: 300, height: 100, alignment: .center)
                                        .padding(.bottom, 20)
                                        .padding(.leading)
                                        .padding(.trailing)
                                        .padding(.top)
                                }
                            }
                            
                            
                            
                        }
                    }
                    //zstack
                    //scrollview vertical
                    //text with color
                    //hstack -- grid, gridrow, rectangle, rounded circle, text in between,
                    
                    
                    
                }
            }
        }
    }
}
@ViewBuilder
private var overlayView: some View {
    VStack(alignment: .leading){
        Text("Started trip to Whole Foods")
            .padding(.trailing, 40)
            .padding(.bottom, 10)
            .foregroundColor(.black)
            .font(.system(size:18, weight: .bold))
        Text("Purchased: ")
            .padding(.trailing, 40)
            .padding(.bottom, 10)
            .foregroundColor(.black)
            .font(.system(size:15))
    }
}
#Preview {
    activity()
}
