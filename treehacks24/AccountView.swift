//
//  AccountView.swift
//  treehacks24
//
//  Created by Elaine Zhai on 2/17/24.
//

import SwiftUI
import UIKit

struct ImagePicker: UIViewControllerRepresentable {
    @Binding var image: UIImage?
    var sourceType: UIImagePickerController.SourceType = .photoLibrary // Added sourceType property
    @Environment(\.presentationMode) var presentationMode

    class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
        let parent: ImagePicker

        init(_ parent: ImagePicker) {
            self.parent = parent
        }

        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            if let image = info[.originalImage] as? UIImage {
                parent.image = image
            }

            parent.presentationMode.wrappedValue.dismiss()
        }
    }

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    func makeUIViewController(context: Context) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.delegate = context.coordinator
        picker.sourceType = sourceType // Use the sourceType property
        return picker
    }

    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {}
}

struct EditProfileView: View {
    @State private var image: UIImage?
    @State private var showingImagePicker = false
    @State private var sourceType: UIImagePickerController.SourceType = .photoLibrary
    @Binding var name: String // Now this is a binding
    @Binding var userName: String // Now this is a binding
    @Binding var location: String // Now this is a binding
    @Binding var venmo: String // Now this is a binding
    @Binding var bio: String // Now this is a binding

    
    @Environment(\.presentationMode) var presentationMode // Used to dismiss the view


    var body: some View {
            ZStack {
                Color(red: 76 / 255.0, green: 86 / 255.0, blue: 57 / 255.0)
                    .edgesIgnoringSafeArea(.all)
                
                VStack {
                    Text("Edit Profile")
                        .font(.system(size: 25))
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding(.top, -20)
                    
                    if let image = image {
                        Image(uiImage: image)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 140, height: 140)
                            .clipShape(Circle())
                            .overlay(Circle().stroke(Color.white, lineWidth: 4))
                            .shadow(radius: 10)
                    } else {
                        Image("profile_pic") // Placeholder or default image
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 140, height: 140)
                            .clipShape(Circle())
                            .overlay(Circle().stroke(Color.white, lineWidth: 4))
                            .shadow(radius: 10)
                    }
                    
                    Button(action: {
                        self.showingImagePicker = true
                    }) {
                        Text("Change Profile Photo")
                            .foregroundColor(.white) // Set the text color to white
                    }
                    .padding(.top, 10) // Adjust the value as needed
                    .actionSheet(isPresented: $showingImagePicker) {
                        ActionSheet(title: Text("Select Photo"), message: Text("Choose"), buttons: [
                            .default(Text("Photo Library")) {
                                self.sourceType = .photoLibrary
                                self.showingImagePicker = true
                            },
                            .default(Text("Camera")) {
                                self.sourceType = .camera
                                self.showingImagePicker = true
                            },
                            .cancel()
                        ])
                    }
                    .sheet(isPresented: $showingImagePicker) {
                        ImagePicker(image: self.$image, sourceType: self.sourceType)
                    }
                    VStack(alignment: .leading) {
                        Text("Name:")
                            .font(.system(size: 25))
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .padding(.top, 10)
                            .padding(.leading, 40)
                        
                        // Editable TextField for user's name
                        TextField("Enter your name", text: $name)
                            .font(.system(size: 20))
                            .background(Color(red: 76 / 255.0, green: 86 / 255.0, blue: 57 / 255.0)) // Match the background color
                            .foregroundColor(Color(.lightGray))
                            .padding(.horizontal, 40) // Match leading padding of "Name:" text and add some horizontal padding
                            .padding(.top, -10)
                    }
                    
                    VStack(alignment: .leading) {
                        Text("Username:")
                            .font(.system(size: 25))
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .padding(.top, 20)
                            .padding(.leading, 40)
                        
                        // Editable TextField for user's name
                        TextField("Enter your username", text: $userName)
                            .font(.system(size: 20))
                            .background(Color(red: 76 / 255.0, green: 86 / 255.0, blue: 57 / 255.0)) // Match the background color
                            .foregroundColor(Color(.lightGray))
                            .padding(.horizontal, 40) // Match leading padding of "Name:" text and add some horizontal padding
                            .padding(.top, -10)
                    }
                    VStack(alignment: .leading) {
                        Text("Location:")
                            .font(.system(size: 25))
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .padding(.top, 20)
                            .padding(.leading, 40)
                        
                        // Editable TextField for user's name
                        TextField("Enter location", text: $location)
                            .font(.system(size: 20))
                            .background(Color(red: 76 / 255.0, green: 86 / 255.0, blue: 57 / 255.0)) // Match the background color
                            .foregroundColor(Color(.lightGray))
                            .padding(.horizontal, 40) // Match leading padding of "Name:" text and add some horizontal padding
                            .padding(.top, -10)
                    }
                    VStack(alignment: .leading) {
                        Text("Venmo:")
                            .font(.system(size: 25))
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .padding(.top, 20)
                            .padding(.leading, 40)
                        
                        // Editable TextField for user's name
                        TextField("Enter venmo handle", text: $venmo)
                            .font(.system(size: 20))
                            .background(Color(red: 76 / 255.0, green: 86 / 255.0, blue: 57 / 255.0)) // Match the background color
                            .foregroundColor(Color(.lightGray))
                            .padding(.horizontal, 40) // Match leading padding of "Name:" text and add some horizontal padding
                            .padding(.top, -10)
                    }
                    VStack(alignment: .leading) {
                        Text("Bio:")
                            .font(.system(size: 25))
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .padding(.top, 20)
                            .padding(.leading, 40)
                        
                        // Editable TextField for user's name
                        TextField("Enter bio", text: $bio)
                            .font(.system(size: 20))
                            .background(Color(red: 76 / 255.0, green: 86 / 255.0, blue: 57 / 255.0)) // Match the background color
                            .foregroundColor(Color(.lightGray))
                            .padding(.horizontal, 40) // Match leading padding of "Name:" text and add some horizontal padding
                            .padding(.top, -10)
                    }
                    Spacer()
                    Button(action: {
                        // Action to save the data and potentially navigate back or dismiss
                        //saveData()
                        presentationMode.wrappedValue.dismiss() // Dismiss the view
                    }) {
                        Text("Save")
                            .frame(minWidth: 0, maxWidth: .infinity)
                            .padding()
                            .background(Color(red: 76 / 255.0, green: 86 / 255.0, blue: 57 / 255.0)) // Change this to match your background color
                            .foregroundColor(.white)
                            .cornerRadius(10)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.white, lineWidth: 2))
                            .padding(.horizontal)
                    }
                    //Spacer()
                
    
            }
        }
    }
}

struct AccountView: View {
    @State private var name: String = "Sally Shopper" // Initialize with the user's current name
    @State private var userName: String = "@sallyshopper" // Initialize with the user's user name
    @State private var location: String = "Stern Residence Hall" // Initialize with the user's location
    @State private var venmo: String = "@paymepls" // Initialize with the user's venmo handle
    @State private var bio: String = "Fav stores: Costco" // Initialize with the user's bio
    
    var body: some View {
        NavigationView {
            ZStack {
                // Background color
                Color(red: 76 / 255.0, green: 86 / 255.0, blue: 57 / 255.0)
                    .edgesIgnoringSafeArea(.all)
                
                VStack {
                    Text(name)
                        .font(.system(size: 25))
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding(.top, -20)
                    
                    // Profile image
                    Image("profile_pic")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 140, height: 140)
                        .clipShape(Circle())
                        .overlay(Circle().stroke(Color.white, lineWidth: 4))
                        .shadow(radius: 10)
                        .padding(.top, 0)
                    
                    // User's username
                    Text(userName)
                        .font(.system(size: 14)) // Adjusted font size to 14
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding(.top, 8)
                    
                    // Shaded green box with dorm location
                    Text(location)
                        .padding(EdgeInsets(top: 5, leading: 10, bottom: 5, trailing: 10)) // Example of smaller padding
                        .background(Color(red: 150 / 255.0, green: 165 / 255.0, blue: 120 / 255.0))
                        .cornerRadius(8)
                        .font(.system(size: 14))
                        .foregroundColor(.white)
                    
                    HStack {
                        Text("So far, you've:")
                            .font(.system(size: 25)) // Adjusted font size to 20
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .padding(.leading, 40)
                            .padding(.top, 20)
                        Spacer() // This will push the text to the left
                    }
                    Image("graph")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 300)
                    VStack(alignment: .leading) {
                        (Text("saved an avg of ") +
                        Text("4.5 trips per month").bold())
                            .font(.system(size: 16))
                            .foregroundColor(.white)
                            .padding(.bottom, 5)
                        
                        (Text("shopped for ") +
                        Text("32 people total").bold())
                            .font(.system(size: 16))
                            .foregroundColor(.white)
                            .padding(.bottom, 5)

                        
                        (Text("hopped on ") +
                        Text("12 trips").bold())
                            .font(.system(size: 16))
                            .foregroundColor(.white)
                            .padding(.bottom, 5)

                        
                        (Text("diverted ") +
                        Text("35 tons of CO₂").bold())
                            .font(.system(size: 16))
                            .foregroundColor(.white)
                    }.padding(.leading, -10)
                    
                    HStack {
                        Text("Badges:")
                            .font(.system(size: 25)) // Adjusted font size to 20
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .padding(.leading, 40)
                            .padding(.top, 10)
                        Spacer() // This will push the text to the left
                    }
                    
                    Spacer()
                }
            }
            .navigationBarItems(trailing: NavigationLink(destination: EditProfileView(name: $name, userName: $userName, location: $location, venmo: $venmo, bio: $bio )) {
                            Image(systemName: "pencil")
                                .foregroundColor(.white)
                        })
                        .navigationBarTitle("", displayMode: .inline)
                        .navigationBarBackButtonHidden(true)
        }
    }
}

struct AccountView_Previews: PreviewProvider {
    static var previews: some View {
        AccountView()
    }
}
