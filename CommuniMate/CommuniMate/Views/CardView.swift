//
//  CardView.swift
//  ProvaMC2
//
//  Created by Jarvis on 18/11/21.
//

import SwiftUI

struct CardView: View {
    @EnvironmentObject var connector : Connector
    let categories = CategoriesLibrary()
    @State var name : String = ""
    @State var question : String = ""
    @Binding var becameListener : Bool
    @State var finish : Bool = false
    var body: some View {
        ZStack {
            NavigationLink(destination: Text("Finish"), isActive: $finish){
                EmptyView()
            }
            RoundedRectangle(cornerRadius: 14)
                .fill(Color.white)
            VStack(spacing: 15){
                Text("\(name)")
                    .font(.body)
                    .fontWeight(.bold)
                Text("\(question)").minimumScaleFactor(0.5)
                Divider()
                Button{
                    if(connector.turnList.count == 0){
                        finish.toggle()
                    }else{
                        print("\(connector.turnList.description)")
                    let talker = connector.turnList[Int.random(in: 0..<connector.turnList.count)]
                    print("\(talker.displayName)")
                    connector.sendList(to: [talker])
                    connector.sendTalker(to: talker)
                    becameListener.toggle()
                    }
                }label: {
                    Text("Pass the floor")
                        .font(.body)
                        .fontWeight(.bold)
                }
            }.onAppear(perform: {
                let chosenCategories = connector.chosenCategories
                let key = chosenCategories[Int.random(in: 0..<chosenCategories.count)]
                let argument = categories.categories[key]
                let questionChosen = argument![Int.random(in: 0..<argument!.count)]
                name = key
                question = questionChosen
            })
            
        }
        .frame(width: 270.0, height: 137.0)
    }
}


