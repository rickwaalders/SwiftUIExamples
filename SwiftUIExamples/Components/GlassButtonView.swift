//
//  GlassButtonView.swift
//  SwiftUIExamples
//
//  Created by Rick Waalders on 11/08/2023.
//

import SwiftUI

struct GlassButtonView: View {
    @State private var gradientStart = UnitPoint(x: 0, y: 0)
    @State private var gradientEnd = UnitPoint(x: 0, y: 1)
    
    let title: String
    let action: () -> Void
    
    init(title: String, action: @escaping () -> Void) {
        self.title = title
        self.action = action
    }
    
    var body: some View {
  
        Button(action: action) {
            Text(title)
                .font(.system(size: 32, weight: .semibold))
                .foregroundColor(.white.opacity(0.85))
                .shadow(color: Color.black.opacity(1), radius: 0, x: 0, y: 1)
                .padding(.horizontal, 48)
                .padding(.vertical, 16)
                .background(
                    LinearGradient(gradient: Gradient(colors: [Color.white.opacity(0),Color.white.opacity(0), Color.white.opacity(0.05), Color.white.opacity(0.1)]), startPoint: .top, endPoint: .bottom)
                        .cornerRadius(.infinity)
                        .shadow(color: Color.black.opacity(1), radius: 0, x: 0, y: 1)
                )
                .background(
                    RoundedRectangle(cornerRadius: .infinity)
                        .strokeBorder(LinearGradient(gradient: Gradient(colors: [Color.white.opacity(0.5), Color.black.opacity(0.2), Color.black.opacity(0.1), Color.black.opacity(0.1), Color.white.opacity(0.5)]), startPoint: gradientStart, endPoint: gradientEnd), lineWidth: 1)
                        .shadow(color: Color.black.opacity(1), radius: 24, x: 0, y: 12)
                                   
                )

        }
        .buttonStyle(PlainButtonStyle())
        .onAppear {
            animateButton()
        }
            

    }
    
    func animateButton() {
        withAnimation(Animation.easeIn(duration: 6).repeatForever(autoreverses: true)) {
            gradientStart = UnitPoint(x: 1, y: 0)
            gradientEnd = UnitPoint(x: 0, y: 1)
        }
    }
}

struct GlassButtonView_Previews: PreviewProvider {
    static var previews: some View {
        GlassButtonView(title: "Test Title") {
            print("Button Pressed!")
        }
    }
}
