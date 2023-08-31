//
//  Onboarding3VC.swift
//  MoonX
//
//  Created by Ömer Faruk Ercivan on 28.08.2023.
//

import UIKit
import NeonSDK
import SnapKit

final class Onboarding3VC: UIViewController {

    private var backgroundImage = UIImageView()
    private let label = UILabel()
    private let label2 = UILabel()
    private let placeLabel = UILabel()
    private let placeField = UITextField()
    private let nextButton = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
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

        placeLabel.text = "Enter Your Place of Birth"
        placeLabel.font = .systemFont(ofSize: 16)
        placeLabel.textColor = .white
        placeLabel.textAlignment = .center
        placeLabel.numberOfLines = 0
        view.addSubview(placeLabel)
        placeLabel.snp.makeConstraints { make in
            make.bottom.equalTo(label2.snp.bottom).offset(72)
            make.left.equalTo(view.safeAreaLayoutGuide.snp.left).offset(48)
            make.right.equalTo(view.safeAreaLayoutGuide.snp.right).inset(48)
            make.centerX.equalToSuperview()
        }

        placeField.placeholder = "09/03/1999"
        placeField.tintColor = .yellow
        placeField.textColor = .white1
        placeField.textAlignment = .center
        placeField.borderStyle = .none
        placeField.backgroundColor = .darkPurple
        placeField.layer.cornerRadius = 16
        view.addSubview(placeField)
        placeField.snp.makeConstraints { make in
            make.top.equalTo(placeLabel.snp.bottom).offset(8)
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

    }

    @objc private func nextButtonTapped() {
        present(destinationVC: InnAppVC(), slideDirection: .right)
        Neon.onboardingCompleted()
    }
}
