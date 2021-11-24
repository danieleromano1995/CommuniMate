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
    @State private var showAlert = false
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
                        showAlert = true
                    }.alert("You are the Host, do you\nreally want to end this session?", isPresented: $showAlert){
                        Button("Leave", role: .destructive) {
                            connector.sendHost()
                            connector.stopAdvertising()
                            isHost = false
                            connector.disconnect()
                        }
                        Button("Cancel", role: .cancel){
                            showAlert = false
                        }
                    }
                }
            }
        }
            
        
    }
}


