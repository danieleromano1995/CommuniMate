//
//  ConversationMainView.swift
//  CommuniMate
//
//  Created by Jarvis on 18/11/21.
//

import SwiftUI

import SwiftUI

struct ConversationsMainView: View {
    @EnvironmentObject var connector : Connector
    @State var isHost = false
    @State var isGuest = false
    @State var isStarting = false
    var body: some View {
        NavigationView {
            ZStack{
                Image("Living Room").edgesIgnoringSafeArea(.all).scaledToFill()
            VStack(){
                NavigationLink(destination: Host(isHost: $isHost, isStarting:$isStarting), isActive: $isHost){ EmptyView()
                }
                NavigationLink(destination: Guest(isGuest: $isGuest, isStarting: $isStarting), isActive: $isGuest){ EmptyView()
                }

                ForEach(connector.invitee, id: \.self){ invitee in
                    Button{
                        connector.askForInvite(peer: connector.sessionInvited[connector.invitee.firstIndex(of: invitee)!])
                        isGuest = true
                    }label: {
                        VStack{
                            Image("cerchietto")
                            Text("\(invitee)")
                        }
                    }.position(x: CGFloat.random(in: 50..<350), y: CGFloat.random(in: (100..<500)) )
                }
            }
                .navigationTitle("Conversations")
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button("Host"){
                            isHost = true
                            connector.startAdvertising()
                        }
                    }
                }
            }
        }.navigationBarHidden(true)
            .navigationTitle("")
            
    }
}


struct ConversationsMainView_Previews: PreviewProvider {
    static var previews: some View {
        ConversationsMainView()
    }
}
