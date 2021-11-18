//
//  Main.swift
//  CommuniMate
//
//  Created by Jarvis on 18/11/21.
//

import SwiftUI

struct Main: View {
    @EnvironmentObject var connector : Connector
    
    var body: some View {
            TabView(selection: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Selection@*/.constant(1)/*@END_MENU_TOKEN@*/) {
                ConversationsMainView().tabItem {
                    Image(systemName: "message.circle.fill")
                    Text("Conversations") }.tag(1)
                Text("Settings").tabItem {
                    Image(systemName: "gearshape.circle.fill")
                    Text("Settings") }.tag(2)
            }.navigationBarHidden(true)
                .navigationBarTitle("").onAppear {
                   
                    if #available(iOS 15.0, *) {
                        let appearance = UITabBarAppearance()
                        UITabBar.appearance().scrollEdgeAppearance = appearance
                        
                    }
                }
        
                
                
    }
}

struct Main_Previews: PreviewProvider {
    static var previews: some View {
        Main()
    }
}

