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
                NavigationLink(destination: Text("profile")) {
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
    }
}

struct Settings_Previews: PreviewProvider {
    static var previews: some View {
        Settings()
    }
}
