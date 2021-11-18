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
    
    var body: some View {
        NavigationLink(destination: Text("Categories").navigationBarBackButtonHidden(true), isActive: $connector.isStarting){
            EmptyView()
        }
        List{
            ForEach(connector.connectedPeers.map(\.displayName), id: \.self){ peers in
                
                Text(peers)
                
            }
        }.navigationBarBackButtonHidden(true)
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



