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
            if(onBoardingNeeded) {
                Onboarding1()
                
            }
            else {
                Main().environmentObject(connector)
            }
            
        }
    }
}
