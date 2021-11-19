//
//  Host.swift
//  CommuniMate
//
//  Created by Jarvis on 18/11/21.
//

import SwiftUI

struct Host: View {
    @EnvironmentObject var connector : Connector
    @Binding var isHost : Bool
    @Binding var isStarting : Bool
    var body: some View {
        NavigationLink(destination: Categories(isHost: $isHost).navigationBarBackButtonHidden(true), isActive: $isStarting){
            EmptyView()
        }
        List{
            ForEach(connector.connectedPeers.map(\.displayName), id: \.self){ peers in
                
                Text(peers)
                
            }
        }.navigationBarBackButtonHidden(true)
        .navigationTitle("You are hosting: ").toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button("Start"){
                    connector.sendReady()
                    isStarting.toggle()
                }
            }
            ToolbarItem(placement: .navigationBarLeading){
                HStack{
                    Image(systemName: "chevron.left").foregroundColor(.accentColor)
                    Button("Back"){
                        isHost = false
                        connector.stopAdvertising()
                        connector.disconnect()
                    }
                }
            }
        }
            
        
    }
}


