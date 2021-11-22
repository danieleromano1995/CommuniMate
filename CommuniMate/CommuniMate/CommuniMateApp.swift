//
//  CommuniMateApp.swift
//  CommuniMate
//
//  Created by Jarvis on 18/11/21.
//

import SwiftUI

@main
struct CommuniMateApp: App {
    @StateObject var connector = Connector()
    @AppStorage ("onBoardingNeeded") var onBoardingNeeded: Bool = true
    var body: some Scene {
        WindowGroup {
            Main().environmentObject(connector).sheet(isPresented: $onBoardingNeeded){
                Onboarding1()
            }
                
            
        }
    }
}
