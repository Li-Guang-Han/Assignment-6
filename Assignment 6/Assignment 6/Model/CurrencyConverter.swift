//
//  CurrencyConverter.swift
//  Assignment 6
//
//  Created by Garrett Li on 6/29/25.
//


import Foundation

struct Currency {
    static let rates: [String: Double] = [
        "EUR": 0.85,
        "GBP": 0.73,
        "JPY": 144.14,
        "CAD": 1.36,
    ]

    static func convert(usd: Int, to currency: String) -> Double? {
        guard let rate = rates[currency] else { return nil }
        return Double(usd) * rate
    }

    static func formattedLabel(for currency: String, usd: Int) -> String {
        if let converted = convert(usd: usd, to: currency) {
            return "Amount in \(currency): \(String(format: "%8.2f", converted))"
        } else {
            return "Conversion failed for \(currency)"
        }
    }
}


