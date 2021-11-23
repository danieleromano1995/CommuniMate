//
//  TalkerView.swift
//  ProvaMC2
//
//  Created by Jarvis on 18/11/21.
//

import SwiftUI

struct TalkerView: View {
    @EnvironmentObject var connector : Connector
    @State var becameListener : Bool = false
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    @State var timeRemaining = 300
    @State private var showingAlert = false
    @State private var returnMain = false
    func convertTimeMinutesSeconds(timeInSeconds: Int) -> String {
        let minutes = timeInSeconds / 60
        let seconds = timeInSeconds % 60
        
        if(timeRemaining <= 0){
            return "00:00"
        }else{
            return String(format: "%02i:%02i",minutes,seconds)
        }
    }
    var body: some View {
        ZStack{
            Color("bg").edgesIgnoringSafeArea(.all)
            NavigationLink(destination: ListenerView().navigationBarBackButtonHidden(true), isActive: $becameListener){
                EmptyView()
            }
            NavigationLink(destination: Main().navigationBarBackButtonHidden(true), isActive: $returnMain){
                EmptyView()
            }
            VStack(spacing: 50){
                Text(convertTimeMinutesSeconds(timeInSeconds:timeRemaining))
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(Color("AccentColor"))
                    .onReceive(timer){_ in
                        timeRemaining -= 1
                    }
                CardView(becameListener: $becameListener)
                
                
                HStack(){
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
                
            }.navigationTitle("It's your turn!").toolbar {
                ToolbarItem{
                    Button("Exit"){
                        showingAlert = true
                    }.alert("Do you really wanna leave a conversation\nbefore it's over?", isPresented: $showingAlert){
                        Button("Leave", role: .destructive) {
                            let talker = connector.turnList[Int.random(in: 0..<connector.turnList.count)]
                            print("\(talker.displayName)")
                            connector.sendList(to: [talker])
                            connector.sendTalker(to: talker)
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

struct TalkerView_Previews: PreviewProvider {
    static var previews: some View {
        TalkerView()
    }
}
