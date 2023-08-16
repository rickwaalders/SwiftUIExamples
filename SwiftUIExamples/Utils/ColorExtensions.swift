//
//  ColorExtensions.swift
//  SwiftUIExamples
//
//  Created by @rickwaalders on 11/08/2023.
//

import SwiftUI

extension Color {
    init(hex: String) {
        let hexSanitized = hex.trimmingCharacters(in: .whitespacesAndNewlines)
        let hexStart = hexSanitized.hasPrefix("#") ? hexSanitized.index(hexSanitized.startIndex, offsetBy: 1) : hexSanitized.startIndex
        let hexColor = String(hexSanitized[hexStart...])
        let scanner = Scanner(string: hexColor)
        var hexNumber: UInt64 = 0

        if scanner.scanHexInt64(&hexNumber) {
            let red = Double((hexNumber & 0xFF0000) >> 16) / 255.0
            let green = Double((hexNumber & 0x00FF00) >> 8) / 255.0
            let blue = Double(hexNumber & 0x0000FF) / 255.0

            self.init(
                .sRGB,
                red: red,
                green: green,
                blue: blue,
                opacity: 1.0
            )
        } else {
            self.init(.sRGB, red: 0, green: 0, blue: 0, opacity: 1.0) 
        }
    }
}
