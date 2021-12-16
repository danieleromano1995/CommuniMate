//
//  ProvaGesture.swift
//  EWE
//
//  Created by Jarvis on 13/12/21.
//

import SwiftUI
import UIKit.UIGestureRecognizer

struct ProvaGesture: View {
    var body: some View {
        WhenCircle().stroke(style: StrokeStyle(lineWidth: 20, lineCap: .round, lineJoin: .round))
            
        
    }
}

struct ProvaGesture_Previews: PreviewProvider {
    static var previews: some View {
        ProvaGesture()
            .preferredColorScheme(.dark)
    }
}
