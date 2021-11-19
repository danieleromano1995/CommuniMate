//
//  Onboarding3.swift
//  CommuniMate
//
//  Created by Antonella Basso on 18/11/21.
//

import SwiftUI

struct Onboarding3: View {
    @AppStorage ("onBoardingNeeded") var onBoardingNeeded: Bool = false
    @AppStorage("name") var name : String = ""
    @AppStorage("surname") var surname : String = ""
    @AppStorage("pronouns") var pronouns : String = ""
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
                
                List{
                    Section{
                    TextField("Name", text: $name)
                        TextField("Surname", text: $surname)
                        
                    }header: {
                        Text("Profile")
                    }
                    Picker("Pronouns", selection: $pronouns) {
                    ForEach(pronounsChoice, id: \.self) {
                        Text($0)
                    }
                    }.pickerStyle(.inline)
                }
                
            }
        }
    }
}

struct Onboarding3_Previews: PreviewProvider {
    static var previews: some View {
        Onboarding3(name: "", surname: "", pronouns: "")
    }
}
