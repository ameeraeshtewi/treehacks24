
//  activity.swift
//  treehacks24
//
//  Created by Ameera Eshtewi on 2/17/24.
//


//if there is data present, show
//if not, then under upcoming and past trips, show nothing or something
//like start a trip!
import SwiftUI
import MapKit

struct activity: View {
    @State private var fullView = false
    @State private var region = MKCoordinateRegion(
                   center: CLLocationCoordinate2D(
                       latitude: 40.83834587046632,
                       longitude: 14.254053016537693),
                       span: MKCoordinateSpan(
                       latitudeDelta: 0.03,
                       longitudeDelta: 0.03)
                   )
    var body: some View {
        ZStack(alignment: .center){
            Color(red: 0.2980392156862745, green: 0.33725490196078434, blue: 0.2235294117647059)
                .ignoresSafeArea()
            ScrollView(.vertical){
                VStack(alignment: .center){
                    Text("Activity")
                        .foregroundColor(Color(red: 1, green: 0.9725490196078431, blue: 0.9098039215686274))
                        .font(.system(.largeTitle, weight: .bold))
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
                                    .overlay(VStack(alignment: .leading){
                                        Text("Started trip to Whole Foods")
                                            .padding(.trailing, 40)
                                            .padding(.bottom, 2)
                                            .foregroundColor(.black)
                                            .font(.system(size:18, weight: .bold))
                                        Text("Purchased: ")
                                            .padding(.trailing, 40)
                                            .padding(.bottom, 10)
                                            .foregroundColor(.black)
                                            .font(.system(size:15))
                                        Button("See full trip details"){
                                            fullView = true
                                        }
                                        .padding(.leading, 10)
                                        .padding(.trailing, 20)
                                        .background(Color(red: 0.5882352941176471, green: 0.6470588235294118, blue: 0.47058823529411764))
                                        .cornerRadius(15)
                                        
                                        .padding(.bottom, 5)
                                        .foregroundColor(.black)
                                        .font(.system(size:12))
                                        .popover(isPresented: $fullView){
                                            ZStack(alignment: .center){
                                                Color(red: 1, green: 0.9725490196078431, blue: 0.9098039215686274)
                                                    .ignoresSafeArea()
                                                ScrollView(.vertical){
                                                    VStack(alignment:.center){
                                                        Text("Alicia’s Whole Foods Trip")
                                                            .font(.system(size:28, weight: .bold))
                                                            .underline()
                                                            .padding(.top, 60)
                                                            .padding(.bottom, 15)
                                                            .foregroundColor(Color(red: 0.2980392156862745, green: 0.33725490196078434, blue: 0.2235294117647059))
                                                        Text("Your Items")
                                                            .padding(.top, 10)
                                                            .font(.system(size:16, weight: .bold))
                                                            .padding(.bottom, 10)
                                                            .padding(.leading, 14)
                                                            .padding(.trailing, 20)
                                                            .background(Color(red: 0.5882352941176471, green: 0.6470588235294118, blue: 0.47058823529411764))
                                                            .cornerRadius(15)
                                                        VStack(alignment: .leading){
                                                            Text("• Oranges")
                                                                .padding(.top, 5)
                                                                .padding(.leading, -70)
                                                                .padding(.bottom, 5)
                                                            Text("• Activia Yogurt")
                                                                .padding(.leading, -70)
                                                                .padding(.bottom, 5)
                                                            Text("• Belvita Cinnamon Bars")
                                                                .padding(.leading, -70)
                                                                .padding(.bottom, 20)
                                                        
                                                        }
                                                        Text("Pickup Location")
                                                            .padding(.top, 10)
                                                            .font(.system(size:16, weight: .bold))
                                                            .padding(.bottom, 10)
                                                            .padding(.leading, 14)
                                                            .padding(.trailing, 20)
                                                            .background(Color(red: 0.5882352941176471, green: 0.6470588235294118, blue: 0.47058823529411764))
                                                            .cornerRadius(15)
                                                        Text("McIver Residence Hall \n103 Raleigh St.\nChapel Hill, NC 27514")
                                                            .padding(.top, 5)
                                                            .padding(.leading, -70)
                                                            .padding(.bottom, 20)
                                                        Text("Pickup Time")
                                                            .padding(.top, 10)
                                                            .font(.system(size:16, weight: .bold))
                                                            .padding(.bottom, 10)
                                                            .padding(.leading, 14)
                                                            .padding(.trailing, 20)
                                                            .background(Color(red: 0.5882352941176471, green: 0.6470588235294118, blue: 0.47058823529411764))
                                                            .cornerRadius(15)
                                                        Text("5:00 pm")
                                                            .padding(.top, 5)
                                                            .padding(.leading, -120)
                                                            .padding(.bottom, 5)
                                                       MapKit()
                                                       
                                                    }
                                                
                                                    
                                                }
                                                
                                            }
                                            
                                           
                                        }
                                       }
                             )}
                        
                            
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
                        
                    }
                }
            }
        }
    }
}

#Preview {
    activity()
}
