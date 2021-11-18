//
//  Onboarding1.swift
//  CommuniMate
//
//  Created by Antonella Basso on 18/11/21.
//

import SwiftUI

struct Onboarding1: View {
    var body: some View {
        VStack(spacing: 60){
            Text("What's CommuniMate")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(Color.black)
                .multilineTextAlignment(.center)
                .frame(maxWidth: .infinity, alignment: .center)
                .padding(.horizontal, 35)
            HStack(){
                VStack(alignment:.leading, spacing: 20){
                    Image(systemName: "lightbulb")
                        .foregroundColor(.accentColor)
                        .font(.title)
                        .frame(width: 60, height: 60, alignment: .center)
                    Image(systemName: "arrow.up.message")
                        .foregroundColor(.accentColor)
                        .font(.title)
                        .frame(width: 60, height: 60, alignment: .center)
                    Image(systemName: "plus.message")
                        .foregroundColor(.accentColor)
                        .font(.title)
                        .frame(width: 60, height: 60, alignment: .center)
                }
                VStack(alignment:.leading, spacing: 20){
                    VStack(alignment: .leading){
                        Text("Idea!")
                            .font(.callout)
                            .fontWeight(.bold)
                            .foregroundColor(Color.black)
                        Text("Inclusion starts with a good\nconversation.")
                            .font(.callout)
                            .fontWeight(.regular)
                            .foregroundColor(Color.gray)
                        
                    }
                    VStack(alignment: .leading){
                        Text("Join a Conversation")
                            .font(.callout)
                            .fontWeight(.bold)
                            .foregroundColor(Color.black)
                        Text("Tap on the profile you want to communicate with.")
                            .font(.callout)
                            .fontWeight(.regular)
                            .foregroundColor(Color.gray)
                    }
                    VStack(alignment: .leading){
                        Text("Create a New Conversation")
                            .font(.callout)
                            .fontWeight(.bold)
                            .foregroundColor(Color.black)
                        Text("Tap on “New” to create a new \ncool place where you can talk.")
                            .font(.callout)
                            .fontWeight(.regular)
                            .foregroundColor(Color.gray)
                    }
                }
            }
            Button(action: {}) {
                Text("Continue")
                    .font(.callout)
                    .fontWeight(.bold)
                    .padding()
            }
            .frame(maxWidth: .infinity, alignment: .center)
            .foregroundColor(.white)
            .background(Color.accentColor)
            .cornerRadius(10.0)
            .padding(.top, 100)
            .padding(.horizontal, 65)
        }
    }
}

struct Onboarding1_Previews: PreviewProvider {
    static var previews: some View {
        Onboarding1()
    }
}
