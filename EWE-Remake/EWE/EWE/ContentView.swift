//
//  ContentView.swift
//  EWE
//
//  Created by Jarvis on 13/12/21.
//

import SwiftUI
struct WhenCircle : Shape {
    func path(in rect: CGRect) -> Path {
        var p = Path()

        p.addArc(center: CGPoint(x: UIScreen.main.bounds.size.width*0.5, y:UIScreen.main.bounds.size.height*0.45), radius: 115, startAngle: .degrees(220), endAngle: .degrees(320), clockwise: true)

        return p
    }
}

struct WhereCircle : Shape {
    func path(in rect: CGRect) -> Path {
        var p = Path()

        p.addArc(center: CGPoint(x: UIScreen.main.bounds.size.width*0.5, y:UIScreen.main.bounds.size.height*0.45), radius: 139, startAngle: .degrees(220), endAngle: .degrees(320), clockwise: true)

        return p
    }
}

struct WhatCircle : Shape {
    func path(in rect: CGRect) -> Path {
        var p = Path()

        p.addArc(center: CGPoint(x: UIScreen.main.bounds.size.width*0.5, y:UIScreen.main.bounds.size.height*0.45), radius: 163, startAngle: .degrees(220), endAngle: .degrees(320), clockwise: true)

        return p
    }
}

struct ContentView: View {
    var body: some View {
        ZStack{
                
            WhenCircle().stroke(style: StrokeStyle(lineWidth: 20, lineCap: .round, lineJoin: .round))
            WhereCircle().stroke(style: StrokeStyle(lineWidth: 20, lineCap: .round, lineJoin: .round))
            WhatCircle().stroke(style: StrokeStyle(lineWidth: 20, lineCap: .round, lineJoin: .round))
            Circle()
                .frame(width: 20.0, height: 20.0).offset(CGSize(width: 0, height: -173))
            
           
            
//            Circle()
//                .stroke(lineWidth: 8)
//                .fill(/*@START_MENU_TOKEN@*/Color.blue/*@END_MENU_TOKEN@*/)
//                .padding(.all, 25.0)
//            Circle()
//                .stroke(lineWidth: 8)
//                .fill(/*@START_MENU_TOKEN@*/Color.blue/*@END_MENU_TOKEN@*/)
//                .padding(.all, 50.0)
//            Circle()
//                .stroke(style: StrokeStyle(lineWidth: 8, lineCap: .round, lineJoin: .round, dash: [200,500], dashPhase: 600))
//                .fill(/*@START_MENU_TOKEN@*/Color.blue/*@END_MENU_TOKEN@*/)
//                .padding(.all, 75)
                
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
.previewInterfaceOrientation(.portraitUpsideDown)
    }
}
