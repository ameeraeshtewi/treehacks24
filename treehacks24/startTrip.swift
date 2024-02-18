//
//  startTrip.swift
//  treehacks24
//
//  Created by Elaine Zhai on 2/17/24.
//
import SwiftUI
import MapKit

struct startTripView: View {


    @State private var startTimeText = "" // User-entered time as text

    @State private var searchText = ""
    @State private var items = [String]()
    @State private var addedItems = [String]()
    
    @State private var navigateToActivities = false

    

    private func searchItems(searchText: String) -> [String] {
            if searchText.isEmpty { return items }
            return items.filter { $0.lowercased().contains(searchText.lowercased()) }
        }
    
    var body: some View {
        NavigationView{
            ZStack {
    
                Color(red: 76 / 255.0, green: 86 / 255.0, blue: 57 / 255.0)
                    .edgesIgnoringSafeArea(.all)
                VStack {
                    Text("Start Trip")
                        .font(.system(size: 30))
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding(.top, 20)

                    Text("Time")
                        .padding(.top, 30)
                        .padding(.bottom, 10)
                        .foregroundColor(.white)
                        .fontWeight(.bold)
                        .font(.system(size: 20))
                    
                    TextField("Set Time", text: $startTimeText)
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .background(Color(red: 150 / 255.0, green: 165 / 255.0, blue: 120 / 255.0))
                        .cornerRadius(5.0)
                        .multilineTextAlignment(.center)
                        .frame(width: 200) // Specify the width here
                    
                    .padding()
                    
                    TextField("Search...", text: $searchText)
                        .padding(7)
                        .background(Color(.systemGray6))
                        .cornerRadius(8)
                        .padding(.horizontal, 10)
                        .onSubmit {
                            addSearchTextToList()
                        }
                        .submitLabel(.done)
                        .edgesIgnoringSafeArea(.all)
                    List {
                        ForEach(addedItems, id: \.self) { addedItem in
                            HStack {
                                Text(addedItem)
                                Spacer()
                                Button(action: {
                                    if let index = addedItems.firstIndex(of: addedItem) {
                                        addedItems.remove(at: index)
                                    }
                                }) {
                                    Image(systemName: "minus.circle.fill")
                                        .foregroundColor(.red)
                                }
                                
                            }
                        }
                        .onDelete(perform: removeItems)
                    }.background(Color(red: 150 / 255.0, green: 165 / 255.0, blue: 120 / 255.0))
                        .padding()
                    .scrollContentBackground(.hidden)

                    Spacer()
                                    
                    Button(action: {
                        navigateToActivities = true
                        print("Start Trip Button Tapped")
                    }) {
                        Text("Post Trip")
                            .padding(EdgeInsets(top: 5, leading: 10, bottom: 5, trailing: 10))
                            .background(Color(red: 150 / 255.0, green: 165 / 255.0, blue: 120 / 255.0))
                            .cornerRadius(8)
                            .font(.system(size: 14))
                            .foregroundColor(.white)
                    }
                    .padding(.horizontal)
                    .padding(.top, 20)
                    NavigationLink(destination: activity(), isActive: $navigateToActivities) { EmptyView() }
                    .hidden()
                    Spacer()
                   
                }
                
            }
            
        }
    }
    private func addSearchTextToList() {
            let trimmedText = searchText.trimmingCharacters(in: .whitespacesAndNewlines)
            if !trimmedText.isEmpty && !addedItems.contains(trimmedText) {
                addedItems.append(trimmedText)
                searchText = ""
            }
        }
    private func removeItems(at offsets: IndexSet) {
            addedItems.remove(atOffsets: offsets)
        }

}
#Preview {
    startTripView()
}
