//
//  Onboarding1VC.swift
//  MoonX
//
//  Created by Ömer Faruk Ercivan on 28.08.2023.
//

import UIKit
import NeonSDK

final class Onboarding1VC: UIViewController {

	private let nextButton = UIButton()

	override func viewDidLoad() {
		super.viewDidLoad()
		view.backgroundColor = .black
		nextButton.hero.id = "nextButton"

		setupUI()
	}

	private func setupUI() {
		var backgroundImage = UIImageView()
		backgroundImage = UIImageView(image: UIImage(named: "img_background_onboarding1"))
		view.addSubview(backgroundImage)
		backgroundImage.snp.makeConstraints { make in
			make.edges.equalToSuperview()
		}

		let welcomeLabel = UILabel()
		welcomeLabel.text = "Welcome"
		welcomeLabel.font = Font.custom(size: 26, fontWeight: .Medium)
		welcomeLabel.textColor = .white
		view.addSubview(welcomeLabel)
		welcomeLabel.snp.makeConstraints { make in
			make.centerY.equalTo(view.snp.centerY).multipliedBy(1.3)
			make.centerX.equalToSuperview()
		}

		let label = UILabel()
		label.text = "Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusam. Sed ut perspt perspiciatis unde omnis iste natus error si."
		label.font = Font.custom(size: 16, fontWeight: .Regular)
		label.textColor = .white
		label.textAlignment = .center
		label.numberOfLines = 0
		view.addSubview(label)
		label.snp.makeConstraints { make in
			make.top.equalTo(welcomeLabel.snp.bottom).offset(24)
			make.left.equalTo(view.safeAreaLayoutGuide.snp.left).offset(48)
			make.right.equalTo(view.safeAreaLayoutGuide.snp.right).inset(48)
			make.centerX.equalToSuperview()
		}

		nextButton.setTitle("Next", for: .normal)
		nextButton.setTitleColor(.white, for: .normal)
		nextButton.backgroundColor = .lightPurple
		nextButton.layer.borderColor = UIColor.lightPurple.cgColor
		nextButton.layer.cornerRadius = 20
		nextButton.addAction {
			self.present(destinationVC: Onboarding2VC(), slideDirection: .right)
		}
		view.addSubview(nextButton)
		nextButton.snp.makeConstraints { make in
			make.left.equalTo(view.safeAreaLayoutGuide.snp.left).offset(64)
			make.right.equalTo(view.safeAreaLayoutGuide.snp.right).inset(64)
			make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).inset(32)
			make.height.equalTo(nextButton.snp.width).multipliedBy(0.2)
			make.centerX.equalToSuperview()
		}

		let pages = UIImageView()
		pages.image = UIImage(named: "img_pages1")
		view.addSubview(pages)
		pages.snp.makeConstraints { make in
			make.bottom.equalTo(nextButton.snp.top).offset(-24)
			make.centerX.equalToSuperview()
		}
	}
}
