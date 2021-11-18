//
//  Settings.swift
//  CommuniMate
//
//  Created by Antonella Basso on 18/11/21.
//

import SwiftUI

struct Settings: View {
    var body: some View {
        VStack {
            List{
                NavigationLink(destination: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Destination@*/Text("Destination")/*@END_MENU_TOKEN@*/) {
                    Image("peacock")
                        .resizable()
                        .frame(width: 80, height: 80)
                        .padding()
                    VStack(alignment:.leading){
                        Text("Peacock")
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
                NavigationLink(destination: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Destination@*/Text("Destination")/*@END_MENU_TOKEN@*/) {
                    Text("Help")
                        .font(.body)
                        .fontWeight(.regular)
                        .foregroundColor(Color.black)
                }
                NavigationLink(destination: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Destination@*/Text("Destination")/*@END_MENU_TOKEN@*/) {
                    Text("Credits")
                }
            }
        }.navigationTitle("Settings")
    }
}

struct Settings_Previews: PreviewProvider {
    static var previews: some View {
        Settings()
    }
}
