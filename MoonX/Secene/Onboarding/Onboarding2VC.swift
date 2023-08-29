//
//  Onboarding2VC.swift
//  MoonX
//
//  Created by Ömer Faruk Ercivan on 28.08.2023.
//

import UIKit
import NeonSDK
import SnapKit

final class Onboarding2VC: UIViewController {

    var backgroundImage = UIImageView()
    let label = UILabel()
    let dateLabel = UILabel()
    let timeLabel = UILabel()
    let dateField = UITextField()
    let timeField = UITextField()
    let nextButton = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
    }

    private func setupUI() {
        backgroundImage = UIImageView(image: UIImage(named: "img_background_onboarding2"))
        view.addSubview(backgroundImage)
        backgroundImage.snp.makeConstraints { make in
            make.width.equalTo(backgroundImage.snp.width)
        }

        label.text = "Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusam. Sed ut perspt perspiciatis unde omnis iste natus error si."
        label.font = .systemFont(ofSize: 16)
        label.textColor = .white
        label.textAlignment = .center
        label.numberOfLines = 0
        view.addSubview(label)
        label.snp.makeConstraints { make in
            make.bottom.equalTo(backgroundImage.snp.bottom).inset(32)
            make.left.equalTo(view.safeAreaLayoutGuide.snp.left).offset(48)
            make.right.equalTo(view.safeAreaLayoutGuide.snp.right).inset(48)
            make.centerX.equalToSuperview()
        }

        dateLabel.text = "Enter Birth Date"
        dateLabel.font = .systemFont(ofSize: 16)
        dateLabel.textColor = .white
        view.addSubview(dateLabel)
        dateLabel.snp.makeConstraints { make in
            make.top.equalTo(label.snp.bottom).offset(48)
            make.left.equalTo(view.safeAreaLayoutGuide.snp.left).offset(40)
        }

        dateField.placeholder = "09/03/1999"
        dateField.tintColor = .yellow
        dateField.textColor = .white1
        dateField.textAlignment = .center
        dateField.borderStyle = .none
        dateField.backgroundColor = .darkPurple
        dateField.layer.cornerRadius = 16
        view.addSubview(dateField)
        dateField.snp.makeConstraints { make in
            make.top.equalTo(dateLabel.snp.bottom).offset(8)
            make.right.equalTo(view.safeAreaLayoutGuide.snp.right).inset(40)
            make.left.equalTo(view.safeAreaLayoutGuide.snp.left).offset(40)
            make.height.equalTo(48)
        }

        timeLabel.text = "Enter Birth Date"
        timeLabel.font = .systemFont(ofSize: 16)
        timeLabel.textColor = .white
        view.addSubview(timeLabel)
        timeLabel.snp.makeConstraints { make in
            make.top.equalTo(dateField.snp.bottom).offset(24)
            make.left.equalTo(view.safeAreaLayoutGuide.snp.left).offset(40)
        }

        timeField.placeholder = "09/03/1999"
        timeField.tintColor = .yellow
        timeField.textColor = .white1
        timeField.textAlignment = .center
        timeField.borderStyle = .none
        timeField.backgroundColor = .darkPurple
        timeField.layer.cornerRadius = 16
        view.addSubview(timeField)
        timeField.snp.makeConstraints { make in
            make.top.equalTo(timeLabel.snp.bottom).offset(8)
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
        present(destinationVC: Onboarding3VC(), slideDirection: .right)
    }
}
