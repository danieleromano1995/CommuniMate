//
//  Guest.swift
//  CommuniMate
//
//  Created by Jarvis on 18/11/21.
//
import SwiftUI
import Foundation

struct Guest: View {
    @EnvironmentObject var connector : Connector
    @Binding var isGuest : Bool
    @Binding var isStarting : Bool
    @Binding var isHost : Bool
    var body: some View {
        NavigationLink(destination: Categories(isHost: $isHost).navigationBarBackButtonHidden(true), isActive: $connector.isStarting){
            EmptyView()
        }.onAppear(perform: { Timer.scheduledTimer(withTimeInterval: 2, repeats: true) { timer in
            if(connector.connectedPeers.count == 0){
                isGuest = false
                timer.invalidate()
            }
        }
        })
        List{
            ForEach(connector.connectedPeers.map(\.displayName), id: \.self){ peers in
                
                Text(peers)
                
            }
        }
        .navigationBarBackButtonHidden(true)
        .navigationTitle("Joining people ").toolbar {
            ToolbarItem(placement: .navigationBarLeading){
                HStack{
                    Image(systemName: "chevron.left").foregroundColor(.accentColor)
                    Button("Back"){
                        isGuest = false
                        connector.disconnect()
                    }
                }
            }
        }
            
        
    }
}



