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
                    Section{
                        NavigationLink(destination: ProfileView()) {
                            Image(uiImage: ((UIImage(data: profile) ?? UIImage(named: "person"))!))
                                .resizable()
                                .frame(width: 80, height: 80)
                                .clipShape(Circle())
                                .padding()
                                .foregroundColor(Color.white)
                            VStack(alignment:.leading){
                                Text("\(name)")
                                    .font(.title2)
                                    .fontWeight(.bold)
                                    .foregroundColor(Color.black)
                                    .multilineTextAlignment(.center)
                                Text("Your profile")
                                    .font(.title2)
                                    .fontWeight(.regular)
                                    .multilineTextAlignment(.center)
                            }
                            
                        }
                        
                    }
                    Section{
                        NavigationLink(destination: Text("Help")) {
                            HStack{
                                Image(systemName: "questionmark.circle").foregroundColor(.accentColor)
                                Text("Help")
                                    .font(.body)
                                    .fontWeight(.regular)
                                    .foregroundColor(Color.black)
                            }
                           
                        }
                        NavigationLink(destination: Text("Credits")) {
                            HStack{
                                Image(systemName: "c.circle").foregroundColor(.accentColor)
                                Text("Credits")
                            }
                        }
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
