//
//  Onboarding3VC.swift
//  MoonX
//
//  Created by Ömer Faruk Ercivan on 28.08.2023.
//

import UIKit
import SnapKit
import NeonSDK
import CoreLocation

final class Onboarding3VC: UIViewController {

	private var backgroundImage = UIImageView()
	private let label = UILabel()
	private let label2 = UILabel()
	private let locationLabel = UILabel()
	private let locationField = UITextField()
	private let nextButton = UIButton()
	private let pages = UIImageView()
	private var locationManager = CLLocationManager()

	override func viewDidLoad() {
		super.viewDidLoad()
		view.backgroundColor = .black
		nextButton.hero.id = "nextButton"

		setupUI()

		locationManager.delegate = self
		locationManager.desiredAccuracy = kCLLocationAccuracyBest
		locationManager.requestWhenInUseAuthorization()
		locationManager.startUpdatingLocation()
	}

	private func setupUI() {
		backgroundImage.image = UIImage(named: "img_background_onboarding3")
		view.addSubview(backgroundImage)
		backgroundImage.snp.makeConstraints { make in
			make.width.equalTo(backgroundImage.snp.width)
		}

		label.text = "Lorem Ipsum"
		label.font = .systemFont(ofSize: 24)
		label.textColor = .white
		label.textAlignment = .center
		label.numberOfLines = 0
		view.addSubview(label)
		label.snp.makeConstraints { make in
			make.bottom.equalTo(backgroundImage.snp.bottom).inset(40)
			make.left.equalTo(view.safeAreaLayoutGuide.snp.left).offset(48)
			make.right.equalTo(view.safeAreaLayoutGuide.snp.right).inset(48)
			make.centerX.equalToSuperview()
		}


		label2.text = "Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusam. Sed ut perspt perspiciatis unde omnis iste natus error si."
		label2.font = .systemFont(ofSize: 16)
		label2.textColor = .white
		label2.textAlignment = .center
		label2.numberOfLines = 0
		view.addSubview(label2)
		label2.snp.makeConstraints { make in
			make.top.equalTo(label.snp.bottom).offset(32)
			make.left.equalTo(view.safeAreaLayoutGuide.snp.left).offset(48)
			make.right.equalTo(view.safeAreaLayoutGuide.snp.right).inset(48)
			make.centerX.equalToSuperview()
		}

		locationLabel.text = "Enter Your Place of Birth"
		locationLabel.font = .systemFont(ofSize: 16)
		locationLabel.textColor = .white
		locationLabel.textAlignment = .center
		locationLabel.numberOfLines = 0
		view.addSubview(locationLabel)
		locationLabel.snp.makeConstraints { make in
			make.bottom.equalTo(label2.snp.bottom).offset(72)
			make.left.equalTo(view.safeAreaLayoutGuide.snp.left).offset(48)
			make.right.equalTo(view.safeAreaLayoutGuide.snp.right).inset(48)
			make.centerX.equalToSuperview()
		}

		locationField.attributedPlaceholder = NSAttributedString(string: "09/03/1999", attributes: [.foregroundColor: UIColor.white1])
		locationField.textColor = .white1
		locationField.textAlignment = .center
		locationField.borderStyle = .none
		locationField.backgroundColor = .darkPurple
		locationField.layer.cornerRadius = 16
		view.addSubview(locationField)
		locationField.snp.makeConstraints { make in
			make.top.equalTo(locationLabel.snp.bottom).offset(8)
			make.right.equalTo(view.safeAreaLayoutGuide.snp.right).inset(40)
			make.left.equalTo(view.safeAreaLayoutGuide.snp.left).offset(40)
			make.height.equalTo(48)
		}

		nextButton.setTitle("Next", for: .normal)
		nextButton.setTitleColor(.white, for: .normal)
		nextButton.backgroundColor = .lightPurple
		nextButton.layer.borderColor = UIColor.lightPurple.cgColor
		nextButton.layer.cornerRadius = 20
		nextButton.addTarget(self, action: #selector(nextButtonTapped), for: .touchDown)
		view.addSubview(nextButton)
		nextButton.snp.makeConstraints { make in
			make.left.equalTo(view.safeAreaLayoutGuide.snp.left).offset(64)
			make.right.equalTo(view.safeAreaLayoutGuide.snp.right).inset(64)
			make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).inset(32)
			make.height.equalTo(48)
			make.centerX.equalToSuperview()
		}

		pages.image = UIImage(named: "img_pages3")
		view.addSubview(pages)
		pages.snp.makeConstraints { make in
			make.bottom.equalTo(nextButton.snp.top).offset(-40)
			make.centerX.equalToSuperview()
		}
	}

	@objc private func nextButtonTapped() {
		let asd = locationField.text!.replacingOccurrences(of: " ", with: "")
		UserDefaults.standard.set(asd, forKey: "location")

		present(destinationVC: InnAppVC(), slideDirection: .right)
		Neon.onboardingCompleted()
	}
}

extension Onboarding3VC: CLLocationManagerDelegate {
	func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
		if let location = locations.last {
			let geocoder = CLGeocoder()
			geocoder.reverseGeocodeLocation(location) { placemarks, error in
				if let error = error {
					print("Geocode Hatası: \(error.localizedDescription)")
					return
				}

				if let placemark = placemarks?.first {
					if let city = placemark.locality {
						self.locationField.text = city
					}
				}
			}
		}
	}

	func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
		if status == .authorizedWhenInUse {
			locationManager.startUpdatingLocation()
		} else if status == .denied {
			ShowAlert.showAlert(title: "Warning", message: "You have not allowed location access. Your location will be set to Ankara. ", viewController: self)
			locationField.text = "Ankara"
		}
	}

	func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
		print("Konum alınamadı: \(error.localizedDescription)")
	}
}
