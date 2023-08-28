//
//  DateUtils.swift
//  MoviesApp
//
//  Created by Ahmed Hamdy on 27/08/2023.
//

import Foundation

class DateUtils {
    static let baseDateFormatter = DateFormatter()

    static func formatDate(_ dateText: String) -> String? {
        baseDateFormatter.dateFormat = "yyyy-mm-dd"
        guard let text = baseDateFormatter.date(from: dateText) else {
            return nil
        }
        return text.formatted(date: .long, time: .omitted)
    }
}
