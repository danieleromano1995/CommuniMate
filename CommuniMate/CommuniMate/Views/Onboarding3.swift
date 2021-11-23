//
//  Onboarding3.swift
//  CommuniMate
//
//  Created by Antonella Basso on 18/11/21.
//

import SwiftUI

struct Onboarding3: View {
    @AppStorage ("onBoardingNeeded") var onBoardingNeeded: Bool = true
    @AppStorage("name") var name : String = ""
    @AppStorage("pronouns") var pronouns : String = ""
    @AppStorage("profile") var profile : Data = Data()
    @State private var image = UIImage(named: "camera")
    @State private var showingAlert = false
    @State private var showSheet = false
    let pronounsChoice = ["She/Her", "He/Him","They/Them"]
    var body: some View {
        ZStack{
            Color("bg").edgesIgnoringSafeArea(.all)
            VStack(spacing: 40){
                Spacer()
                Text("Create your \nprofile")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(Color.black)
                    .multilineTextAlignment(.center)
                    .frame(maxWidth: .infinity, alignment: .center)
                    .padding(.horizontal, 35)
                Image(uiImage: self.image!)
                    .resizable()
                    .scaledToFill()
                    .cornerRadius(50)
                    .frame(width: 120, height: 120)
                    .overlay(Circle().stroke(lineWidth:5).foregroundColor(.accentColor))
                    .clipShape(Circle())
                    .onTapGesture {
                        showSheet = true
                    }
                Text("Take a nice selfie!").font(.subheadline)
                    .fontWeight(.thin)
                    .foregroundColor(Color.gray)
                    .multilineTextAlignment(.center)
                    .frame(maxWidth: .infinity, alignment: .center)
                    .padding(.horizontal, 35)
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
                Button{
                    if(name == "" || pronouns == ""){
                        showingAlert = true
                    }else{
                        if(image == UIImage(named: "camera")){
                            image = UIImage(named: "person")
                        }
                        let data = image!.jpegData(compressionQuality: 1.0)
                        profile = data!
                        onBoardingNeeded = false
                    }
                }label: {
                    Text("Continue")
                        .font(.callout)
                        .fontWeight(.bold)
                        .padding()
                        .frame(maxWidth: .infinity, alignment: .center)
                        .foregroundColor(.white)
                        .background(Color.accentColor)
                        .cornerRadius(10.0)
                        .padding(.horizontal, 65)
                        .padding(.bottom, 50)
                }.alert("Insert your name and\nchoose your pronouns\nto help the others\nidentify you.", isPresented: $showingAlert){
                    Button("OK", role: .cancel) { }
                }
                
            }.sheet(isPresented: $showSheet) {
                ImagePicker(sourceType: .camera, selectedImage: self.$image)
            }
        }
    }
}

struct Onboarding3_Previews: PreviewProvider {
    static var previews: some View {
        Onboarding3(name: "", pronouns: "")
    }
}
