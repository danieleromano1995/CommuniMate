//
//  Profile.swift
//  CommuniMate
//
//  Created by Jarvis on 23/11/21.
//

import SwiftUI

struct ProfileView: View {
    @AppStorage("name") var name : String = ""
    @AppStorage("pronouns") var pronouns : String = ""
    @AppStorage("profile") var profile : Data = Data()
    
    @State private var image = UIImage(named: "person")
    @State private var showSheet2 = false
    
    let pronounsChoice = ["She/Her", "He/Him","They/Them"]
    var body: some View {
        ZStack {
            Color("bg").edgesIgnoringSafeArea(.all)
            VStack{
                Image(uiImage: self.image!)
                    .resizable()
                    .scaledToFill()
                    .cornerRadius(50)
                    .frame(width: 120, height: 120)
                    .overlay(Circle().stroke(lineWidth:5).foregroundColor(.accentColor))
                    .clipShape(Circle())
                    .onTapGesture {
                        showSheet2 = true
                    }
                List{
                    Section{
                        TextField("Name", text: $name)
                        
                    }header: {
                        Text("Profile")
                    }
                    Picker("Pronouns", selection: $pronouns) {
                        ForEach(pronounsChoice, id: \.self) {
                            Text($0)
                        }
                    }.pickerStyle(.inline)
                }
            }.toolbar{
                ToolbarItem{
                    Button("Save"){
                        let data = image!.jpegData(compressionQuality: 1.0)
                        profile = data!
                    }
                }
            }
            .onAppear(perform: {
                self.image = UIImage(data: profile)!
            })

        }.sheet(isPresented: $showSheet2) {
            ImagePicker(sourceType: .camera, selectedImage: self.$image)
        }
}
}
struct Profile_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
