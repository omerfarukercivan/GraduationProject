//
//  APIManager.swift
//  MoonX
//
//  Created by Ömer Faruk Ercivan on 6.09.2023.
//

import Foundation
import Alamofire
import ChatGPTSwift

class APIManager {
	static let shared = APIManager()

	var weatherDate = ""
	var gptDate = ""
	var lunarTip = ""

	func fetchWeatherData(completion: @escaping([String: Any]?, Error?) -> Void) {
		let key = "CZMGSHZDK65BQXPVXGVWW3QJ6"
		let adress = UserDefaults.standard.value(forKey: "location")! as! String

		let url = "https://weather.visualcrossing.com/VisualCrossingWebServices/rest/services/timeline/\(adress)/\(weatherDate)?unitGroup=metric&key=\(key)&include=days&elements=datetime,sunrise,sunset,moonset,moonrise,temp,conditions"

		AF.request(url, method: .get).responseJSON { response in
			switch response.result {
			case .success(let value):
				if let json = value as? [String: Any] {
					completion(json, nil)
				} else {
					completion(nil, NSError(domain: "APIManager", code: 0))
				}
			case .failure(let error):
				completion(nil, error)
			}
		}
	}

	func getHoroscope(horoscopeName: String, completion: @escaping (Result<String, Error>) -> Void) {
		let gptApi = ChatGPTAPI(apiKey: "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")

		let text = "If I am a \(horoscopeName), pretend you are a fortune teller, please generate my horoscope for \(gptDate) \(lunarTip)."
//Please try to limit it 120 words
		if gptDate == "" {
			gptDate = "today"
		}

//		if lunarTip != "" {
//			text = "If I am a \(horoscopeName), pretend you are a fortune teller, please generate my horoscope for \(gptDate) for \(lunarTip). Please try to limit it 120 words"
//		}

		print(text)
		print(lunarTip)
		Task {
			do {
				let response = try await gptApi.sendMessage(text: text)
				completion(.success(response))
			} catch {
				completion(.failure(error))
			}
		}
	}
}
