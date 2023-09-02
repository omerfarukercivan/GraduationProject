//
//  TabBar.swift
//  MoonX
//
//  Created by Ömer Faruk Ercivan on 29.08.2023.
//

import UIKit

class TabBarController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()

        let vc1 = UINavigationController(rootViewController: HomeVC())
        let vc2 = UINavigationController(rootViewController: MeditationVC())
        let vc3 = UINavigationController(rootViewController: SettingsVC())

        vc1.tabBarItem.image = UIImage(named: "btn_home")
        vc2.tabBarItem.image = UIImage(named: "btn_meditation")
        vc3.tabBarItem.image = UIImage(named: "btn_settings")

        vc1.title = "Home"
        vc2.title = "Meditation"
        vc3.title = "Profile"
        //        tabBarController?.tabBar.layer.zPosition = -1
        //        tabBar.backgroundColor = .black
        setViewControllers([vc1, vc2, vc3], animated: true)

        if let viewControllers = viewControllers {
            for navigationController in viewControllers {
                if let navController = navigationController as? UINavigationController {
                    navController.navigationBar.isHidden = true
                }
            }
        }
    }
}
