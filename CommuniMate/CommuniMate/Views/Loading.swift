//
//  Loading.swift
//  CommuniMate
//
//  Created by Jarvis on 19/11/21.
//

import SwiftUI

struct Loading: View {
    @EnvironmentObject var connector : Connector
    @Binding var isHost : Bool
    @State var isListener : Bool = false
    @State var isTalker : Bool = false
    var body: some View {
        ZStack{
            NavigationLink(destination: TalkerView(), isActive: $isTalker){
                EmptyView()
            }
            NavigationLink(destination: ListenerView(), isActive: $isListener){
                EmptyView()
            }

            VStack{
                Text("Counter: \(connector.readyCounter)")
                Text("All ready: \(connector.allReady.description)")
                Text("Is talker: \(connector.isTalker.description)")
                Text("Is listener: \(connector.isListener.description)")
                Text("Is talker 2: \(isTalker.description)")
                Text("Is listener 2: \(isListener.description)")
            }.navigationTitle("Loading")
                .onAppear(perform: {
                    Timer.scheduledTimer(withTimeInterval: 2, repeats: true) { timer in
                        if(connector.allReady){
                            print(isHost)
                            if(isHost){
                                let talker = connector.turnList[Int.random(in: 0..<connector.turnList.count)]
                                print(talker.displayName)
                                connector.sendTalker(to: talker)
                                connector.talkersList.append(talker.displayName)
                                connector.sendList(to: connector.connectedPeers)
                                connector.turnList.remove(at: connector.turnList.firstIndex(of: talker)!)
                                print("\(connector.turnList)")
                                connector.sendListener(to: connector.turnList)
                                if(connector.isTalker){
                                    isTalker.toggle()
                                }else{
                                    isListener.toggle()
                                }
                            }else{
                                Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { timer in
                                    if(connector.isTalker){
                                        isTalker.toggle()
                                        timer.invalidate()
                                    }else{
                                        isListener.toggle()
                                        timer.invalidate()
                                    }
                                }
                            }
                            timer.invalidate()
                        }
                    }
                })
        }
    }
}

