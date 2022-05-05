//
//  Preference.swift
//  CouponCalendar
//
//  Created by Hyorim Nam on 2022/05/02.
//

import SwiftUI

extension Color{
    init(hex: String){
        let scanner = Scanner(string: hex)
        _ = scanner.scanString("#")
        
        var rgb: UInt64 = 0
        scanner.scanHexInt64(&rgb)
        
        let r = Double((rgb >> 16) & 0xFF) / 255.0
        let g = Double((rgb >> 8) & 0xFF) / 255.0
        let b = Double((rgb >> 0) & 0xFF) / 255.0
        
        self.init(red: r, green: g, blue: b)
    }
    
    static let primaryColor = Color(hex: "#000000")
//    static let brownColor = Color(hex: "#604216")
    static let secondaryColor = Color(hex: "#75ABD5")
    static let greenColor = Color.green
    static let azureColor = Color(hex: "#75ABD5")
    static let orangeColor = Color(hex: "#F7B554")
    static let vividAzureColor = Color(hex: "#008FFF")
    static let vividOrangeColor = Color(hex: "#F3950A")
    static let redAccentColor = Color(hex: "#F55B05")
}

extension Font{
    static let titleFont = Font.system(size: 30, weight: .bold)
    static let mainFont = Font.system(size: 18)
    static let subFont = Font.system(size: 16)
}

enum PlaceType: Int16{
    case cafe
    case restaurant
    case convenience
    case etc
}


