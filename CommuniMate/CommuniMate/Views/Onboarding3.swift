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
    @State private var image = UIImage()
    
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
                Image(uiImage: self.image)
                    .resizable()
                    .cornerRadius(50)
                    .padding(.all, 3)
                    .frame(width: 100, height: 100)
                    .background(Color.black.opacity(0.2))
                    .aspectRatio(contentMode: .fill)
                    .clipShape(Circle())
                    .onTapGesture {
                        showSheet = true
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
                Button{
                    let data = image.jpegData(compressionQuality: 1.0)
                    profile = data!
                    onBoardingNeeded = false
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
                }
                
            }.sheet(isPresented: $showSheet) {
                ImagePicker(sourceType: .photoLibrary, selectedImage: self.$image)
            }
        }
    }
}

struct Onboarding3_Previews: PreviewProvider {
    static var previews: some View {
        Onboarding3(name: "", pronouns: "")
    }
}
