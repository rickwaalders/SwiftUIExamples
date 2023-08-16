//
//  ContentView.swift
//  SwiftUIExamples
//
//  Created by @rickwaalders on 11/08/2023.
//

import SwiftUI

struct ContentView: View {
  
    var body: some View {
        ZStack {
            LinearGradient( gradient: Gradient(colors: [Color(hex: "#4E2E4E"), Color(hex: "#0F2132")]), startPoint: UnitPoint(x: 0, y: 0), endPoint: UnitPoint(x: 1, y: 1))
            .edgesIgnoringSafeArea(.all)
            
            GlassButtonView(title: "Glass Button") {
                print("Button was clicked!")
            }
            
        }

    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
