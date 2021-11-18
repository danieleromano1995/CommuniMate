//
//  Onboarding3.swift
//  CommuniMate
//
//  Created by Antonella Basso on 18/11/21.
//

import SwiftUI

struct Onboarding3: View {
    var body: some View {
        ZStack{
            Color("bg").edgesIgnoringSafeArea(.all)
            VStack(spacing: 60){
                //                Text("Create your profile")
                //                    .font(.largeTitle)
                //                    .fontWeight(.bold)
                //                    .foregroundColor(Color.black)
                //                    .multilineTextAlignment(.center)
                //                    .frame(maxWidth: .infinity, alignment: .center)
                //                    .padding(.horizontal, 100)
                //                Image("peacock")
                List{
                    TextField("Name", text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/)
                    TextField("Surname", text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/)
                    TextField("Pronouns", text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/)
                    
                }
                
            }
        }
    }
}

struct Onboarding3_Previews: PreviewProvider {
    static var previews: some View {
        Onboarding3()
    }
}
