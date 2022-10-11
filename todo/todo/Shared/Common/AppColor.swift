//
//  AppColor.swift
//  todo
//
//  Created by cuongdd on 10/10/2022.
//

import UIKit

class AppColor {
    static let soldierColor = UIColor(hexString: "38761D")
    
    struct Text {
        static let darkText = UIColor(hexString: "50565E")
        static let placehoder = UIColor(hexString: "B2B8C0")
        static let seconary = UIColor(hexString: "888E96")
        static let blue = UIColor(hexString: "0075FF")
        static let gray = UIColor(hexString: "B2B8C0")
        static let error = UIColor(hexString: "FF212C")
        static let inActive = UIColor(hexString: "#B2B8C0")
        static let white = UIColor.white
        
        static let darkGray = UIColor(hexString: "#888E96")
    }
    
    struct Background {
        static let normal = UIColor(hexString: "#023F62")
        static let highlighted = UIColor(hexString: "0063A0")
        static let line = UIColor(hexString: "#E3E7ED")
        static let green = UIColor(hexString: "#33BEAD")
        static let gray = UIColor(hexString: "#E3E7ED")
        static let dotGreen = UIColor(hexString: "00A13F")
        static let red = UIColor(hexString: "FF212C")
        static let polyline = UIColor(hexString: "008CFF")
        
        static let lightestGray = #colorLiteral(red: 0.8901960784, green: 0.9058823529, blue: 0.9294117647, alpha: 0.2) //#E3E7ED 20%
        static let black = UIColor(hexString: "50565E")
        static let blue = UIColor(hexString: "0075FF")
    }
    
    struct Status {
        static let pending = UIColor(hexString: "24C9FD")
        static let active = UIColor(hexString: "00A13F")
        static let incomplete = UIColor(hexString: "FF212C")
        static let complete = UIColor(hexString: "50565E")
        
        static let request = UIColor(hexString: "FF212C")
        static let uploadFailed = UIColor(hexString: "FF212C")
        static let waiting = UIColor(hexString: "50565E")
    }
}
