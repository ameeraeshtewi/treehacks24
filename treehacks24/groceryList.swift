//
//  groceryList.swift
//  treehacks24
//
//  Created by Alicia Bao on 2/17/24.
//


import SwiftUI
import FirebaseFirestore

struct Listitem: Identifiable {
    let id = UUID()
    var title: String
}

class ListModel: ObservableObject {
    @Published var items: [Listitem] = []

    var username: String
    let db = Firestore.firestore()
    
    init(username: String) {
        self.username = username
    }
    
    func addItem(title: String) {
        let newItem = Listitem(title: title)
        items.append(newItem)
        print(username)
        
        let titlesArray = items.map { $0.title }

        Reference the document for this user in the "users" collection
        let userDocument = db.collection("users").document(username)

        //Update the document with the new array of item titles
        userDocument.setData(["groceryList": titlesArray], merge: true) { error in
            if let error = error {
                print("Error updating document: \(error)")
            } else {
                print("Document successfully updated with new item")
            }
        }
        
    }
    
    func deleteItem(at indexSet: IndexSet) {
        items.remove(atOffsets: indexSet)
    }
}



struct groceryList: View {
    @StateObject var listModel: ListModel
    @State private var newItemTitle = ""
    @State private var navigateToStartTrip = false

    var username: String
    
    init(username: String) {
        self.username = username
        _listModel = StateObject(wrappedValue: ListModel(username: username))
    }
    
    var body: some View {
        NavigationView{
            VStack {
                Text("Grocery List")
                    .font(.system(size: 25))
                    .fontWeight(.bold)
                    .foregroundColor(Color(red: 76 / 255.0, green: 86 / 255.0, blue: 57 / 255.0))
                    .padding(.top)
                List {
                    ForEach(listModel.items) { item in
                        Text(item.title)
                        
                    }
                    .onDelete(perform: deleteItem)
                }
                .background(Color(red: 1, green: 0.9725490196078431, blue: 0.9098039215686274))
                .scrollContentBackground(.hidden)
                .frame(height:500)
                HStack {
                    TextField("Enter new item", text: $newItemTitle)
                        .padding()
                        .background(Color.white)
                    Button(action: addItem) {
                        Text("Add")
                            .padding()
                    }
                    .background(Color(red: 0.2980392156862745, green: 0.33725490196078434, blue: 0.2235294117647059))
                    .cornerRadius(15)
                    .buttonBorderShape(.capsule)

                }
                HStack{
                    Button(action: {
                        navigateToStartTrip = true
                    }) {
                        Text("Start a trip")
                            .padding()
                    }
                    .background(Color(red: 0.2980392156862745, green: 0.33725490196078434, blue: 0.2235294117647059))
                    .cornerRadius(15)
                    .buttonBorderShape(.capsule)

                    Button(action: joinTrip) {
                        Text("Join a Trip")
                            .padding()
                    }
                    .background(Color(red: 0.2980392156862745, green: 0.33725490196078434, blue: 0.2235294117647059))
                    .cornerRadius(15)


                }
                NavigationLink(destination: startTripView(), isActive: $navigateToStartTrip) { EmptyView() }

                Spacer()
            }
            .padding()
            .background(Color(red: 1, green: 0.9725490196078431, blue: 0.9098039215686274))
            .accentColor(Color(red: 1, green: 0.9725490196078431, blue: 0.9098039215686274))
        }
        

    }
    // connect with activity page
    func startTrip(){
        
    }
    func joinTrip(){
        
    }
    func addItem() {
           guard !newItemTitle.isEmpty else { return }
           listModel.addItem(title: newItemTitle)
           newItemTitle = ""
       }
       
   func deleteItem(at offsets: IndexSet) {
       listModel.deleteItem(at: offsets)
   }
}



struct ListMakerView_Previews: PreviewProvider {
    static var previews: some View {
        groceryList(username: "PreviewUsername")
    }
}
