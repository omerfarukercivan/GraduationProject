//
//  AppDelegate.swift
//  MoonX
//
//  Created by Ömer Faruk Ercivan on 28.08.2023.
//

import UIKit
import NeonSDK

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        Font.configureFonts(font: .Inter)
        Neon.configure(window: &window, onboardingVC: Onboarding1VC(), paywallVC: InnApp(), homeVC: Onboarding1VC())

        return true
    }
}
