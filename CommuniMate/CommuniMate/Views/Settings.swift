//
//  Settings.swift
//  CommuniMate
//
//  Created by Antonella Basso on 18/11/21.
//

import SwiftUI

struct Settings: View {
    @AppStorage("name") var name : String = ""
    @AppStorage("pronouns") var pronouns : String = ""
    @AppStorage("profile") var profile : Data = Data()
    var body: some View {
        NavigationView{
        VStack {
            List{
                NavigationLink(destination: Text("profile")) {
                    Image(uiImage: (UIImage(data: profile) ?? UIImage(systemName: "person.fill"))!)
                        .resizable()
                        .frame(width: 80, height: 80)
                        .clipShape(Circle())
                        .padding()
                    VStack(alignment:.leading){
                        Text("\(name)")
                            .font(.title2)
                            .fontWeight(.bold)
                            .foregroundColor(Color.black)
                            .multilineTextAlignment(.center)
                        Text("Your profile")
                            .font(.title2)
                            .fontWeight(.regular)
                            .foregroundColor(Color.black)
                            .multilineTextAlignment(.center)
                        //                .padding(.vertical)
                        //                .frame(maxWidth: .infinity, alignment: .center)
                    }
                    
                }
                NavigationLink(destination: Text("Help")) {
                    Text("Help")
                        .font(.body)
                        .fontWeight(.regular)
                        .foregroundColor(Color.black)
                }
                NavigationLink(destination: Text("Credits")) {
                    Text("Credits")
                }
            }
        }.navigationTitle("Settings")
        }.navigationTitle("Settings")
    }
}

struct Settings_Previews: PreviewProvider {
    static var previews: some View {
        Settings()
    }
}
