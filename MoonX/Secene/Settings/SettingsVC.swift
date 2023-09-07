//
//  SettingsVC.swift
//  MoonX
//
//  Created by Ömer Faruk Ercivan on 29.08.2023.
//

import UIKit
import NeonSDK

final class SettingsVC: UIViewController {

	private let backButton = UIButton()
	private let settingsLabel = UILabel()
	private let premiumButton = UIButton()
	private let premiumView = UIImageView()
	private let premiumLabel1 = UILabel()
	private let premiumImage = UIImageView()
	private let premiumLabel2 = UILabel()
	private let privacyButton = UIButton()
	private let privacyImage = UIImageView()
	private let privacyLabel = UILabel()
	private let termsButton = UIButton()
	private let termsImage = UIImageView()
	private let termsLabel = UILabel()
	private let restoreButton = UIButton()
	private let restoreImage = UIImageView()
	private let restoreLabel = UILabel()
	private let helpButton = UIButton()
	private let helpImage = UIImageView()
	private let helpLabel = UILabel()
	private let rateButton = UIButton()
	private let rateImage = UIImageView()
	private let rateLabel = UILabel()

	override func viewDidLoad() {
		super.viewDidLoad()
		view.backgroundColor = .black

		setupUI()
	}

	private func setupUI() {
		settingsLabel.text = "Settings"
		settingsLabel.textColor = .white
		settingsLabel.font = .systemFont(ofSize: 20)
		view.addSubview(settingsLabel)
		settingsLabel.snp.makeConstraints { make in
			make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
			make.centerX.equalToSuperview()
		}

		backButton.setImage(UIImage(named: "btn_back"), for: .normal)
		backButton.addTarget(self, action: #selector(backButtonTapped), for: .touchDown)
		view.addSubview(backButton)
		backButton.snp.makeConstraints { make in
			make.centerY.equalTo(settingsLabel.snp.centerY)
			make.left.equalToSuperview().offset(16)
		}

		premiumButton.setImage(UIImage(named: "img_premium_banner"), for: .normal)
		premiumButton.isHidden = false
		premiumButton.addTarget(self, action: #selector(premiumButtonTapped), for: .touchDown)
		view.addSubview(premiumButton)
		premiumButton.snp.makeConstraints { make in
			make.top.equalTo(settingsLabel.snp.bottom).offset(24)
			make.left.equalToSuperview().offset(16)
			make.right.equalToSuperview().offset(-16)
		}

		premiumView.backgroundColor = .someColor1
		premiumView.layer.cornerRadius = 10
		premiumButton.addSubview(premiumView)
		premiumView.snp.makeConstraints { make in
			make.top.equalToSuperview().offset(16)
			make.left.equalToSuperview().offset(16)
			make.right.equalTo(premiumButton.snp.centerX).multipliedBy(1.4)
			make.bottom.equalTo(premiumButton.snp.centerY).multipliedBy(1.2)
		}

		premiumLabel1.text = "Get Premium \n to Access All Contents!"
		premiumLabel1.textColor = .white
		premiumLabel1.numberOfLines = 0
		premiumLabel1.font = .systemFont(ofSize: 24)
		premiumView.addSubview(premiumLabel1)
		premiumLabel1.snp.makeConstraints { make in
			make.top.equalToSuperview().offset(4)
			make.left.equalToSuperview().offset(4)
		}

		premiumImage.image = UIImage(named: "img_premium_icon")
		premiumView.addSubview(premiumImage)
		premiumImage.snp.makeConstraints { make in
			make.top.equalToSuperview().offset(12)
			make.centerX.equalTo(premiumLabel1.snp.centerX).offset(24)
		}

		premiumLabel2.text = "Unlock package in order to access the features"
		premiumLabel2.textColor = .white
		premiumLabel2.font = .systemFont(ofSize: 15)
		premiumButton.addSubview(premiumLabel2)
		premiumLabel2.snp.makeConstraints { make in
			make.top.equalTo(premiumView.snp.bottom).offset(16)
			make.left.equalToSuperview().offset(8)
			make.right.equalToSuperview().offset(-8)
		}

		privacyButton.backgroundColor = .darkPurple
		privacyButton.layer.cornerRadius = 10
		privacyButton.addTarget(self, action: #selector(privacyButtonTapped), for: .touchDown)
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

		privacyImage.image = UIImage(named: "img_privacy")
		privacyButton.addSubview(privacyImage)
		privacyImage.snp.makeConstraints { make in
			make.centerY.equalToSuperview()
			make.left.equalToSuperview().offset(16)
		}

		privacyLabel.text = "Privacy Policy"
		privacyLabel.textColor = .white
		privacyButton.addSubview(privacyLabel)
		privacyLabel.snp.makeConstraints { make in
			make.centerY.equalToSuperview()
			make.left.equalTo(privacyImage.snp.right).offset(16)
		}

		termsButton.backgroundColor = .darkPurple
		termsButton.layer.cornerRadius = 10
		termsButton.addTarget(self, action: #selector(termsButtonTapped), for: .touchDown)
		view.addSubview(termsButton)
		termsButton.snp.makeConstraints { make in
			make.top.equalTo(privacyButton.snp.bottom).offset(8)
			make.left.equalToSuperview().offset(32)
			make.right.equalToSuperview().offset(-32)
			make.height.equalTo(privacyButton.snp.width).multipliedBy(0.2)
		}

		termsImage.image = UIImage(named: "img_terms")
		termsButton.addSubview(termsImage)
		termsImage.snp.makeConstraints { make in
			make.centerY.equalToSuperview()
			make.left.equalToSuperview().offset(16)
		}

		termsLabel.text = "Terms of Use"
		termsLabel.textColor = .white
		termsButton.addSubview(termsLabel)
		termsLabel.snp.makeConstraints { make in
			make.centerY.equalToSuperview()
			make.left.equalTo(termsImage.snp.right).offset(16)
		}

		restoreButton.backgroundColor = .darkPurple
		restoreButton.layer.cornerRadius = 10
		restoreButton.addTarget(self, action: #selector(restoreButtonTapped), for: .touchDown)
		view.addSubview(restoreButton)
		restoreButton.snp.makeConstraints { make in
			make.top.equalTo(termsButton.snp.bottom).offset(8)
			make.left.equalToSuperview().offset(32)
			make.right.equalToSuperview().offset(-32)
			make.height.equalTo(privacyButton.snp.width).multipliedBy(0.2)
		}

		restoreImage.image = UIImage(named: "img_restore")
		restoreButton.addSubview(restoreImage)
		restoreImage.snp.makeConstraints { make in
			make.centerY.equalToSuperview()
			make.left.equalToSuperview().offset(16)
		}

		restoreLabel.text = "Restore Purchase"
		restoreLabel.textColor = .white
		restoreButton.addSubview(restoreLabel)
		restoreLabel.snp.makeConstraints { make in
			make.centerY.equalToSuperview()
			make.left.equalTo(restoreImage.snp.right).offset(16)
		}

		helpButton.backgroundColor = .darkPurple
		helpButton.layer.cornerRadius = 10
		helpButton.addTarget(self, action: #selector(restoreButtonTapped), for: .touchDown)
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

		helpImage.image = UIImage(named: "img_help")
		helpButton.addSubview(helpImage)
		helpImage.snp.makeConstraints { make in
			make.centerY.equalToSuperview()
			make.left.equalToSuperview().offset(16)
		}

		helpLabel.text = "Help Us"
		helpLabel.textColor = .white
		helpButton.addSubview(helpLabel)
		helpLabel.snp.makeConstraints { make in
			make.centerY.equalToSuperview()
			make.left.equalTo(helpImage.snp.right).offset(16)
		}

		rateButton.backgroundColor = .darkPurple
		rateButton.layer.cornerRadius = 10
		rateButton.addTarget(self, action: #selector(rateButtonTapped), for: .touchDown)
		view.addSubview(rateButton)
		rateButton.snp.makeConstraints { make in
			make.top.equalTo(helpButton.snp.bottom).offset(8)
			make.left.equalToSuperview().offset(32)
			make.right.equalToSuperview().offset(-32)
			make.height.equalTo(privacyButton.snp.width).multipliedBy(0.2)
		}

		rateImage.image = UIImage(named: "img_rate")
		rateButton.addSubview(rateImage)
		rateImage.snp.makeConstraints { make in
			make.centerY.equalToSuperview()
			make.left.equalToSuperview().offset(16)
		}

		rateLabel.text = "Rate Us"
		rateLabel.textColor = .white
		rateButton.addSubview(rateLabel)
		rateLabel.snp.makeConstraints { make in
			make.centerY.equalToSuperview()
			make.left.equalTo(rateImage.snp.right).offset(16)
		}
	}

	@objc private func premiumButtonTapped() {
		present(destinationVC: InnAppVC(), slideDirection: .up)
	}

	@objc private func privacyButtonTapped() {
		SettingsManager.openLinkFromBrowser(url: "https://www.neonapps.co/privacy-policy")
	}

	@objc private func termsButtonTapped() {
		SettingsManager.openLinkFromBrowser(url: "https://www.neonapps.co/terms-of-use")
	}

	@objc private func backButtonTapped() {
		self.dismiss(animated: true)
	}

	@objc private func restoreButtonTapped() {
		if !Neon.isUserPremium {
			RevenueCatManager.restorePurchases(vc: self, animation: .loadingBar) {
				self.present(destinationVC: HomeVC(), slideDirection: .up)
			} completionFailure: {
				print("restore error")
			}
		}
	}

	@objc private func helpButtonTapped() {
		SettingsManager.openLinkFromBrowser(url: "https://www.neonapps.co/contact-us")
	}

	@objc private func rateButtonTapped() {
		SettingsManager.openLinkFromBrowser(url: "itms-apps://itunes.apple.com/app/id1576477935?action=write-review")
	}
}
