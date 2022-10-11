//
//  Date+Extension.swift
//  todo
//
//  Created by cuongdd on 10/10/2022.
//

import Foundation

extension Date {
    func convertToString(format: String) -> String? {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        formatter.locale = Locale(identifier: "en_FR")
        return formatter.string(from: self)
    }
}
