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
    @State private var tips : TipsLibrary = TipsLibrary()
    @State private var key1 : String = ""
    @State private var key2 : String = ""
    @State private var key3 : String = ""
    @State private var tip1 : String = ""
    @State private var tip2 : String = ""
    @State private var tip3 : String = ""
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
            NavigationLink(destination: ConversationsMainView().navigationBarBackButtonHidden(true), isActive: $returnMain){
                EmptyView()
            }.onAppear(perform: {
                key1 = tips.tipKeys[Int.random(in: 0..<tips.tipKeys.count)]
                key2 = tips.tipKeys[Int.random(in: 0..<tips.tipKeys.count)]
                key3 = tips.tipKeys[Int.random(in: 0..<tips.tipKeys.count)]
                tip1 = tips.tips[key1]!
                tip2 = tips.tips[key2]!
                tip3 = tips.tips[key3]!
            })
            VStack(spacing: 50){
                Text(convertTimeMinutesSeconds(timeInSeconds:timeRemaining))
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(Color("AccentColor"))
                    .onReceive(timer){_ in
                        timeRemaining -= 1
                    }
                CardView(becameListener: $becameListener)
                
                
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
                    
                }.padding(.leading,10).padding(.trailing,20)
            }.navigationTitle("It's your turn!").toolbar {
                ToolbarItem{
                    Button("Exit"){
                        showingAlert = true
                    }.alert("Do you really wanna leave a conversation\nbefore it's over?", isPresented: $showingAlert){
                        Button("Leave", role: .destructive) {
                            if(connector.connectedPeers.count != 0){
                                let talker = connector.turnList[Int.random(in: 0..<connector.turnList.count)]
                                print("\(talker.displayName)")
                                connector.sendList(to: [talker])
                                connector.sendTalker(to: talker)
                            }
                            connector.stopAdvertising()
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
