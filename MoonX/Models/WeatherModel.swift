//
//  WeatherModel.swift
//  MoonX
//
//  Created by Ömer Faruk Ercivan on 1.09.2023.
//

import Foundation

struct WeatherModel: Codable {
    let resolvedAddress: String?
//    let days: [Days]
}

struct Days: Codable {
    let sunrise: String?
    let sunset: String?
    let moonrise: String?
    let moonset: String?
    let temp: Float?
}
