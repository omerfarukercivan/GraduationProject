//
//  Onboarding1VC.swift
//  MoonX
//
//  Created by Ömer Faruk Ercivan on 28.08.2023.
//

import UIKit
import SnapKit
import Hero

final class Onboarding1VC: UIViewController {

	private var backgroundImage = UIImageView()
	private let welcomeLabel = UILabel()
	private let label = UILabel()
	private let pages = UIImageView()
	private let nextButton = UIButton()

	override func viewDidLoad() {
		super.viewDidLoad()
		view.backgroundColor = .black
		nextButton.hero.id = "nextButton"

		setupUI()
	}

	private func setupUI() {
		backgroundImage = UIImageView(image: UIImage(named: "img_background_onboarding1"))
		view.addSubview(backgroundImage)
		backgroundImage.snp.makeConstraints { make in
			make.edges.equalToSuperview()
		}

		welcomeLabel.text = "Welcome"
		welcomeLabel.font = .systemFont(ofSize: 22)
		welcomeLabel.textColor = .white
		view.addSubview(welcomeLabel)
		welcomeLabel.snp.makeConstraints { make in
			make.top.equalTo(view.snp.centerY).offset(80)
			make.centerX.equalToSuperview()
		}

		label.text = "Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusam. Sed ut perspt perspiciatis unde omnis iste natus error si."
		label.font = .systemFont(ofSize: 16)
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
		nextButton.addTarget(self, action: #selector(nextButtonTapped), for: .touchDown)
		view.addSubview(nextButton)
		nextButton.snp.makeConstraints { make in
			make.left.equalTo(view.safeAreaLayoutGuide.snp.left).offset(64)
			make.right.equalTo(view.safeAreaLayoutGuide.snp.right).inset(64)
			make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).inset(32)
			make.height.equalTo(48)
			make.centerX.equalToSuperview()
		}

		pages.image = UIImage(named: "img_pages1")
		view.addSubview(pages)
		pages.snp.makeConstraints { make in
			make.bottom.equalTo(nextButton.snp.top).offset(-40)
			make.centerX.equalToSuperview()
		}
	}

	@objc private func nextButtonTapped() {
		present(destinationVC: Onboarding2VC(), slideDirection: .right)
	}
}
