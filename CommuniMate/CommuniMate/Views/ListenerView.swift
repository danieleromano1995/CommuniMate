//
//  ListenerView.swift
//  ProvaMC2
//
//  Created by Jarvis on 18/11/21.
//

import SwiftUI

struct ListenerView: View {
    @EnvironmentObject var connector : Connector
    @State var becameTalker : Bool = false
    @State private var showingAlert = false
    @State private var returnMain = false
    @State private var tips : TipsLibrary = TipsLibrary()
    @State private var key1 : String = ""
    @State private var key2 : String = ""
    @State private var key3 : String = ""
    @State private var tip1 : String = ""
    @State private var tip2 : String = ""
    @State private var tip3 : String = ""

    var body: some View {
        ZStack{
            NavigationLink(destination: TalkerView().navigationBarBackButtonHidden(true),isActive: $becameTalker){
                EmptyView()
            }
            NavigationLink(destination: ConversationsMainView().navigationBarBackButtonHidden(true), isActive: $returnMain){
                EmptyView()
            }
            Color("bg").edgesIgnoringSafeArea(.all)
            VStack(spacing: 50){
                Image(uiImage: (UIImage(data: connector.currentTalker!.profile) ?? UIImage(systemName: "person.fill"))!).resizable()
                    .scaledToFill()
                    .frame(width: 120, height: 120).clipShape(Circle())                    .overlay(Circle().stroke(lineWidth: 8).foregroundColor(Color.accentColor))
                
                VStack{
                    HStack(spacing: 0){
                        Text("\(connector.currentTalker!.name)")
                            .font(.title2)
                            .fontWeight(.bold)
                        Text("(\(connector.currentTalker!.pronouns))")
                            .font(.title2)
                    }
                    Text("is speaking!")
                        .font(.title2)
                        .fontWeight(.regular)
                }.onAppear(perform: {
                    Timer.scheduledTimer(withTimeInterval: 2, repeats: true) { timer in
                        if(connector.isTalker){
                            becameTalker.toggle()
                            timer.invalidate()
                        }
                    }
                    key1 = tips.tipKeys[Int.random(in: 0..<tips.tipKeys.count)]
                    key2 = tips.tipKeys[Int.random(in: 0..<tips.tipKeys.count)]
                    key3 = tips.tipKeys[Int.random(in: 0..<tips.tipKeys.count)]
                    print("KEYS: "+key1+key2+key3+" KEYS")
                    tip1 = tips.tips[key1]!
                    tip2 = tips.tips[key2]!
                    tip3 = tips.tips[key3]!
                })
                
                VStack(alignment: .leading, spacing: 30){
                    HStack{ Image(systemName: key1)
                            .foregroundColor(Color.gray)
                            .font(.title)
                            .frame(width: 60, height: 60, alignment: .center)
                        Text(tip1)
                            .font(.callout)
                            .fontWeight(.regular)
                            .foregroundColor(Color.gray)
                            .lineLimit(3)
                            .minimumScaleFactor(0.5)
                    }
                    HStack{
                        Image(systemName: key2)
                            .foregroundColor(Color.gray)
                            .font(.title)
                            .frame(width: 60, height: 60, alignment: .center)
                        Text(tip2)
                            .font(.callout)
                            .fontWeight(.regular)
                            .foregroundColor(Color.gray)
                            .lineLimit(3)
                            .minimumScaleFactor(0.5)
                    }
                    HStack{
                        Image(systemName: key3)
                            .foregroundColor(Color.gray)
                            .font(.title)
                            .frame(width: 60, height: 60, alignment: .center)
                        Text(tip3)
                            .font(.callout)
                            .fontWeight(.regular)
                            .foregroundColor(Color.gray)
                            .lineLimit(3)
                            .minimumScaleFactor(0.5)
                    
                        
                    }
                    
                }.padding(.leading, 10).padding(.trailing, 20)
            }.navigationTitle("Listen Carefully").toolbar {
                ToolbarItem{
                    Button("Exit"){
                        showingAlert = true
                    }.alert("Do you really wanna leave a conversation\nbefore it's over?", isPresented: $showingAlert){
                        Button("Leave", role: .destructive) {
                            connector.stopAdvertising()
                            connector.sendLeft()
                            returnMain = true
                            connector.disconnect()
                        }
                        Button("Cancel", role: .cancel){
                            showingAlert = false
                        }
                    }
                }
                
            }
        }
    }
}


