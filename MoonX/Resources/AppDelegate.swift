//
//  AppDelegate.swift
//  MoonX
//
//  Created by Ömer Faruk Ercivan on 28.08.2023.
//

import UIKit
import NeonSDK
import RevenueCat

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

	var window: UIWindow?

	func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

		RevenueCatManager.configure(withAPIKey: "appl_InuhoMFHLXKzspBzKfdJRBroEfG", products: [
			"com.neonapps.education.SwiftyStoreKitDemo.Weekly",
			"com.neonapps.education.SwiftyStoreKitDemo.Montly",
			"com.neonapps.education.SwiftyStoreKitDemo.Annual",
		])

		Font.configureFonts(font: .Inter)
		Neon.configure(window: &window, onboardingVC: Onboarding1VC(), paywallVC: InnAppVC(), homeVC: HomeVC())

		return true
	}
}
