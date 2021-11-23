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
    var body: some View {
        ZStack{
            NavigationLink(destination: TalkerView().navigationBarBackButtonHidden(true),isActive: $becameTalker){
                EmptyView()
            }
            NavigationLink(destination: Main().navigationBarBackButtonHidden(true), isActive: $returnMain){
                EmptyView()
            }
            Color("bg").edgesIgnoringSafeArea(.all)
            VStack(spacing: 50){
                Image(uiImage: (UIImage(data: connector.currentTalker!.profile) ?? UIImage(systemName: "person.fill"))!).resizable()
                    .frame(width: 100.0, height: 100.0).clipShape(Circle())                    .aspectRatio(contentMode: .fill).overlay(Circle().stroke(lineWidth: 8).foregroundColor(Color.accentColor))
                
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
                    
                })
                
                HStack{
                    VStack(spacing: 20){
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
                    VStack(alignment: .leading, spacing: 20){
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
                            Text("Idea!")
                                .font(.callout)
                                .fontWeight(.bold)
                                .foregroundColor(Color.black)
                            Text("Inclusion starts with a good\nconversation.")
                                .font(.callout)
                                .fontWeight(.regular)
                                .foregroundColor(Color.gray)
                        }
                    }
                }
            }.navigationTitle("Listen Carefully").toolbar {
                ToolbarItem{
                    Button("Exit"){
                        showingAlert = true
                    }.alert("Do you really wanna leave a conversation\nbefore it's over?", isPresented: $showingAlert){
                        Button("Leave", role: .destructive) {
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


