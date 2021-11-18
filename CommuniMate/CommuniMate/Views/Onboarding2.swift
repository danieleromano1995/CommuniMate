//
//  Onboarding2.swift
//  CommuniMate
//
//  Created by Antonella Basso on 18/11/21.
//

import SwiftUI

struct Onboarding2: View {
    var body: some View {
        VStack(spacing: 60){
            Text("How to CommuniMate")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(Color.black)
                .multilineTextAlignment(.center)
                .frame(maxWidth: .infinity, alignment: .center)
                .padding(.horizontal, 35)
            HStack(){
                VStack(alignment:.leading, spacing: 30){
                    Image(systemName:"list.bullet.rectangle.portrait")
                        .foregroundColor(.accentColor)
                        .font(.title)
                        .frame(width: 60, height: 60, alignment: .center)
                    Image(systemName:"clock.badge.exclamationmark")
                        .foregroundColor(.accentColor)
                        .font(.title)
                        .frame(width: 60, height: 60, alignment: .center)
                    Image(systemName: "repeat.circle")
                        .foregroundColor(.accentColor)
                        .font(.title)
                        .frame(width: 60, height: 60, alignment: .center)
                }
                VStack(alignment:.leading, spacing: 20){
                    VStack(alignment: .leading){
                        Text("Categories")
                            .font(.callout)
                            .fontWeight(.bold)
                            .foregroundColor(Color.black)
                        Text("Select the categories you’re \nlikely to talk about.")
                            .font(.callout)
                            .fontWeight(.regular)
                            .foregroundColor(Color.gray)
                        
                    }
                    VStack(alignment: .leading){
                        Text("Wait for your turn")
                            .font(.callout)
                            .fontWeight(.bold)
                            .foregroundColor(Color.black)
                        Text("Listen to other people, mind the \ntips for a good conversation \nand have fun!")
                            .font(.callout)
                            .fontWeight(.regular)
                            .foregroundColor(Color.gray)
                    }
                    VStack(alignment: .leading){
                        Text("It’s your turn!")
                            .font(.callout)
                            .fontWeight(.bold)
                            .foregroundColor(Color.black)
                        Text("Ask your question and answer it. \nYou can change the question \nor pass the turn.")
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

struct Onboarding2_Previews: PreviewProvider {
    static var previews: some View {
        Onboarding2()
    }
}
