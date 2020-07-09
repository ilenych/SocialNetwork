//
//  Extensions.swift
//  SocialNetwork
//
//  Copyright © 2020 <ASi. All rights reserved.
//

import Foundation

// Create format "yyyy-MM-dd'T'HH:mm:ss.SSSZZZZZ"
extension DateFormatter {
  static let iso8601Full: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZZZZZ"
    formatter.calendar = Calendar(identifier: .iso8601)
    formatter.timeZone = TimeZone(secondsFromGMT: 0)
    formatter.locale = Locale(identifier: "en_US_POSIX")
    return formatter
  }()
}

// Convert date to string from "yyyy-MM-dd'T'HH:mm:ss.SSSZZZZZ" to Сегодня HH:mm, or Вчера HH:mm, or MMM dd, HH:mm
extension Date {
    func asString() -> String {
        let calendar = Calendar.current
        let formatter = DateFormatter()
        if calendar.isDateInYesterday(self) {
            formatter.dateFormat = "HH:mm"
            return "Вчера в \(formatter.string(from: self))"
        }else if  calendar.isDateInToday(self) {
            formatter.dateFormat = "HH:mm"
            return "Сегодня в \(formatter.string(from: self))"
        }else {
            formatter.dateFormat = "MMM dd, HH:mm"
            return formatter.string(from: self)
        }
    }
}
//Conver string to URL
extension String {
    func getURL() -> URL? {
        guard let url = URL(string: self) else { return nil}
        return url
    }
}

