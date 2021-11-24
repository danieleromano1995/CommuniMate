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
            TabView{
                ConversationsMainView().tabItem {
                    Image(systemName: "message.circle.fill")
                    Text("Conversations") }
                Settings().tabItem {
                    Image(systemName: "gearshape.circle.fill")
                    Text("Settings") }
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

