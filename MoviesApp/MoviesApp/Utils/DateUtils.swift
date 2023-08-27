//
//  DateUtils.swift
//  MoviesApp
//
//  Created by Ahmed Hamdy on 27/08/2023.
//

import Foundation

class DateUtils {
    static let baseDateFormatter = DateFormatter()

    static func formatDate(dateText: String) -> String {
        return (baseDateFormatter.date(from: dateText) ?? Date()).formatted(date: .long, time: .omitted)
    }
}
