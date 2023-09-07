//
//  HoroscopeManager.swift
//  MoonX
//
//  Created by Ömer Faruk Ercivan on 6.09.2023.
//

import Foundation

class HoroscopeManager {
	static func findZodiacSign(for dateOfBirth: String) -> String? {
		let dateFormatter = DateFormatter()
		dateFormatter.dateFormat = "dd/MM/yyyy"

		if let birthDate = dateFormatter.date(from: dateOfBirth) {
			let components = Calendar.current.dateComponents([.day, .month], from: birthDate)

			if let day = components.day, let month = components.month {
				switch (day, month) {
				case (21...31, 3), (1...19, 4):
					return "Aries"
				case (20...30, 4), (1...20, 5):
					return "Taurus"
				case (21...31, 5), (1...20, 6):
					return "Gemini"
				case (21...30, 6), (1...22, 7):
					return "Cancer"
				case (23...31, 7), (1...22, 8):
					return "Leo"
				case (23...31, 8), (1...22, 9):
					return "Virgo"
				case (23...30, 9), (1...22, 10):
					return "Libra"
				case (23...31, 10), (1...21, 11):
					return "Scorpio"
				case (22...30, 11), (1...19, 12):
					return "Sagittarius"
				case (20...31, 12), (1...19, 1):
					return "Capricorn"
				case (20...31, 1), (1...18, 2):
					return "Aquarius"
				default:
					return "Pisces"
				}
			}
		}
		return nil
	}
}
