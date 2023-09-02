//
//  ShowAlert.swift
//  MoonX
//
//  Created by Ömer Faruk Ercivan on 1.09.2023.
//

import UIKit

class ShowAlert {
    static func showAlert(title: String, message: String, viewController: UIViewController) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let cancel = UIAlertAction(title: "Cancel", style: .destructive)
        alert.addAction(cancel)
        viewController.present(alert, animated: true)
    }
}
