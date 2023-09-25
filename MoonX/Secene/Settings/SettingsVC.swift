//
//  SettingsVC.swift
//  MoonX
//
//  Created by Ömer Faruk Ercivan on 29.08.2023.
//

import UIKit
import NeonSDK

final class SettingsVC: UIViewController {

	override func viewDidLoad() {
		super.viewDidLoad()
		view.backgroundColor = .black

		setupUI()
	}

	private func setupUI() {
		let settingsLabel = UILabel()
		settingsLabel.text = "Settings"
		settingsLabel.textColor = .white
		settingsLabel.font = Font.custom(size: 18, fontWeight: .Medium)
		view.addSubview(settingsLabel)
		settingsLabel.snp.makeConstraints { make in
			make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
			make.centerX.equalToSuperview()
		}

		let backButton = UIButton()
		backButton.setImage(UIImage(named: "btn_back"), for: .normal)
		backButton.addAction {
			self.dismiss(animated: true)
		}
		view.addSubview(backButton)
		backButton.snp.makeConstraints { make in
			make.centerY.equalTo(settingsLabel.snp.centerY)
			make.left.equalToSuperview().offset(16)
		}

		let premiumButton = UIButton()
		premiumButton.setImage(UIImage(named: "img_premium_banner"), for: .normal)
		premiumButton.isHidden = false
		premiumButton.addAction {
			self.present(destinationVC: InnAppVC(), slideDirection: .up)
		}
		view.addSubview(premiumButton)
		premiumButton.snp.makeConstraints { make in
			make.top.equalTo(settingsLabel.snp.bottom).offset(24)
			make.left.equalToSuperview().offset(16)
			make.right.equalToSuperview().offset(-16)
		}

		let premiumView = UIImageView()
		premiumView.backgroundColor = .someColor1
		premiumView.layer.cornerRadius = 10
		premiumButton.addSubview(premiumView)
		premiumView.snp.makeConstraints { make in
			make.top.equalToSuperview().offset(16)
			make.left.equalToSuperview().offset(16)
			make.right.equalTo(premiumButton.snp.centerX).multipliedBy(1.4)
			make.bottom.equalTo(premiumButton.snp.centerY).multipliedBy(1.2)
		}

		let premiumLabel1 = UILabel()
		premiumLabel1.text = "Get Premium \nto Access All Contents!"
		premiumLabel1.textColor = .white
		premiumLabel1.numberOfLines = 0
		premiumLabel1.font = Font.custom(size: 20, fontWeight: .SemiBold)
		premiumView.addSubview(premiumLabel1)
		premiumLabel1.snp.makeConstraints { make in
			make.top.equalToSuperview().offset(8)
			make.left.equalToSuperview().offset(4)
		}

		let premiumImage = UIImageView()
		premiumImage.image = UIImage(named: "img_premium_icon")
		premiumView.addSubview(premiumImage)
		premiumImage.snp.makeConstraints { make in
			make.top.equalToSuperview().offset(12)
			make.centerX.equalTo(premiumLabel1.snp.centerX).offset(24)
		}

		let premiumLabel2 = UILabel()
		premiumLabel2.text = "Unlock package in order to access the features"
		premiumLabel2.textColor = .white
		premiumLabel2.font = Font.custom(size: 14, fontWeight: .SemiBold)
		premiumButton.addSubview(premiumLabel2)
		premiumLabel2.snp.makeConstraints { make in
			make.top.equalTo(premiumView.snp.bottom).offset(16)
			make.left.equalToSuperview().offset(8)
			make.right.equalToSuperview().offset(-8)
		}

		let privacyButton = CustomSettingsButton()
		privacyButton.image.image = UIImage(named: "img_privacy")
		privacyButton.label.text = "Privacy Policy"
		privacyButton.addAction {
			SettingsManager.openLinkFromBrowser(url: "https://www.neonapps.co/privacy-policy")
		}
		view.addSubview(privacyButton)
		if Neon.isUserPremium {
			premiumButton.isHidden = true

			privacyButton.snp.makeConstraints { make in
				make.top.equalTo(settingsLabel.snp.bottom).offset(16)
				make.left.equalToSuperview().offset(32)
				make.right.equalToSuperview().offset(-32)
				make.height.equalTo(privacyButton.snp.width).multipliedBy(0.2)
			}
		} else {
			privacyButton.snp.makeConstraints { make in
				make.top.equalTo(premiumButton.snp.bottom).offset(16)
				make.left.equalToSuperview().offset(32)
				make.right.equalToSuperview().offset(-32)
				make.height.equalTo(privacyButton.snp.width).multipliedBy(0.2)
			}
		}

		let termsButton = CustomSettingsButton()
		termsButton.image.image = UIImage(named: "img_terms")
		termsButton.label.text = "Terms of Use"
		termsButton.addAction {
			SettingsManager.openLinkFromBrowser(url: "https://www.neonapps.co/terms-of-use")
		}

		view.addSubview(termsButton)
		termsButton.snp.makeConstraints { make in
			make.top.equalTo(privacyButton.snp.bottom).offset(8)
			make.left.equalToSuperview().offset(32)
			make.right.equalToSuperview().offset(-32)
			make.height.equalTo(termsButton.snp.width).multipliedBy(0.2)
		}

		let restoreButton = CustomSettingsButton()
		restoreButton.image.image = UIImage(named: "img_restore")
		restoreButton.label.text = "Restore Purchase"
		restoreButton.addAction {
			if !Neon.isUserPremium {
				RevenueCatManager.restorePurchases(vc: self, animation: .loadingBar) {
					self.present(destinationVC: HomeVC(), slideDirection: .up)
				} completionFailure: {
					print("restore error")
				}
			}
		}

		view.addSubview(restoreButton)
		restoreButton.snp.makeConstraints { make in
			make.top.equalTo(termsButton.snp.bottom).offset(8)
			make.left.equalToSuperview().offset(32)
			make.right.equalToSuperview().offset(-32)
			make.height.equalTo(restoreButton.snp.width).multipliedBy(0.2)
		}

		let helpButton = CustomSettingsButton()
		helpButton.image.image = UIImage(named: "img_help")
		helpButton.label.text = "Help Us"
		helpButton.addAction {
			SettingsManager.openLinkFromBrowser(url: "https://www.neonapps.co/contact-us")
		}

		view.addSubview(helpButton)
		if Neon.isUserPremium {
			restoreButton.isHidden = true

			helpButton.snp.makeConstraints { make in
				make.top.equalTo(termsButton.snp.bottom).offset(8)
				make.left.equalToSuperview().offset(32)
				make.right.equalToSuperview().offset(-32)
				make.height.equalTo(helpButton.snp.width).multipliedBy(0.2)
			}
		} else {
			helpButton.snp.makeConstraints { make in
				make.top.equalTo(restoreButton.snp.bottom).offset(8)
				make.left.equalToSuperview().offset(32)
				make.right.equalToSuperview().offset(-32)
				make.height.equalTo(helpButton.snp.width).multipliedBy(0.2)
			}
		}

		let rateButton = CustomSettingsButton()
		rateButton.image.image = UIImage(named: "img_rate")
		rateButton.label.text = "Rate Us"
		rateButton.addAction {
			SettingsManager.openLinkFromBrowser(url: "itms-apps://itunes.apple.com/app/id1576477935?action=write-review")
		}

		view.addSubview(rateButton)
		rateButton.snp.makeConstraints { make in
			make.top.equalTo(helpButton.snp.bottom).offset(8)
			make.left.equalToSuperview().offset(32)
			make.right.equalToSuperview().offset(-32)
			make.height.equalTo(rateButton.snp.width).multipliedBy(0.2)
		}
	}
}
