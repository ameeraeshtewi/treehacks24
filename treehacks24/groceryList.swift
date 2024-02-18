//
//  groceryList.swift
//  treehacks24
//
//  Created by Alicia Bao on 2/17/24.
//

import SwiftUI

struct Listitem: Identifiable {
    let id = UUID()
    var title: String
}

class ListModel: ObservableObject {
    @Published var items: [Listitem] = []
    
    func addItem(title: String) {
        items.append(Listitem(title: title))
    }
    
    func deleteItem(at indexSet: IndexSet) {
        items.remove(atOffsets: indexSet)
    }
}



struct groceryList: View {
    @StateObject var listModel = ListModel()
    @State private var newItemTitle = ""
    
    var body: some View {
        VStack {
            List {
                ForEach(listModel.items) { item in
                    Text(item.title)
                }
                .onDelete(perform: deleteItem)
            }
            .frame(height:500)
            HStack {
                TextField("Enter new item", text: $newItemTitle)
                Button(action: addItem) {
                    Text("Add")
                }
            }
            HStack{
                Button(action: startTrip ){
                    Text("Start a trip")
                }
                Button(action: joinTrip) {
                    Text("Join a Trip")
                }
                .padding()            }
            Spacer()
        }
        .padding()
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
        groceryList()
    }
}
