//
//  Color+Extensions.swift
//  Starafa
//
//  Created by macmini on 04/09/2024.
//

import Foundation
import SwiftUI


extension Color {
    static var theme = AppTheme()
    
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (1, 1, 1, 0)
        }

        self.init(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue:  Double(b) / 255,
            opacity: Double(a) / 255
        )
    }
}

struct AppTheme {
    let lightblue = Color("LightBlue")
    let darkblue = Color("DarkBlue")
    let Skyblue = Color("skyblue1")
    let appred = Color("appRed")
    let purplecolor = Color("purplecolor")
    let appblue = Color("lightblue")
    let appPrimary = Color("AppPrimary")
    let LightYellow = Color("LightYellow")
    let appBlack = Color("Black")
    let apptextfield = Color("TextFieldColor")
    let appGray = Color("AppGray")
    let appWhite =  Color("White")
    let Categories = Color("Categories")
    let appGreen  = Color("AppGreen")
    let ChatColor = Color("ChatColor")
    
}
