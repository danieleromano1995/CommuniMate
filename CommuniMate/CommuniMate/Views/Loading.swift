//
//  Loading.swift
//  CommuniMate
//
//  Created by Jarvis on 19/11/21.
//

import SwiftUI
import ActivityIndicatorView

struct Loading: View {
    @EnvironmentObject var connector : Connector
    @Binding var isHost : Bool
    @State var isListener : Bool = false
    @State var isTalker : Bool = false
    @State var isLoading : Bool = true
    private let categories = CategoriesLibrary()
    @State var tips : String = ""
    @AppStorage("name") var name : String = ""
    @AppStorage("pronouns") var pronouns : String = ""
    @AppStorage("profile") var profile : Data = Data()

    var body: some View {
        ZStack{
            NavigationLink(destination: TalkerView().navigationBarBackButtonHidden(true), isActive: $isTalker){
                EmptyView()
            }
            NavigationLink(destination: ListenerView().navigationBarBackButtonHidden(true), isActive: $isListener){
                EmptyView()
            }
            Color.accentColor.edgesIgnoringSafeArea(.all)
            VStack{
                ActivityIndicatorView(isVisible: $isLoading, type: .growingArc(Color.white)).frame(width: 100, height: 100)
                Text("While you are waiting here are some fun facts :").fontWeight(.bold).font(.title2)
                Text("\(tips)").font(.body)
            }.onAppear(perform: {
                    Timer.scheduledTimer(withTimeInterval: 2, repeats: true) { timer in
                        if(connector.allReady){
                            print(isHost)
                            if(isHost){
                                let talker = connector.turnList[Int.random(in: 0..<connector.turnList.count)]
                                if (talker == connector.myPeerId){
                                    connector.talkersList.append(talker.displayName)
                                    connector.send(profile: Profile(name: self.name, pronouns: self.pronouns, profile: self.profile))
                                }
                                print("TALKER: \(talker.displayName)")
                                connector.sendTalker(to: talker)
                                connector.sendList(to: connector.connectedPeers)
                                print("TALKER LIST: \(connector.talkersList)")
                                connector.turnList.remove(at: connector.turnList.firstIndex(of: talker)!)
                                print("TURN LIST: \(connector.turnList)")
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
                }).onAppear(perform: {
                    let chosenCategories = connector.chosenCategories
                    let key = chosenCategories[Int.random(in: 0..<chosenCategories.count)]
                    let argument = categories.tips[key]
                    let tipChosen = argument![Int.random(in: 0..<argument!.count)]
                    tips = tipChosen
                })
        }
    }
}

