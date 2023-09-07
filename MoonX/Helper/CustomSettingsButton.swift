//
//  CustomButton.swift
//  MoonX
//
//  Created by Ömer Faruk Ercivan on 7.09.2023.
//

import UIKit
import NeonSDK

final class CustomSettingsButton: UIButton {

	let image = UIImageView()
	let label = UILabel()

	override init(frame: CGRect) {
		super.init(frame: frame)

		layer.backgroundColor = UIColor.darkPurple.cgColor
		layer.cornerRadius = 10

		addSubview(self.image)
		self.image.snp.makeConstraints { make in
			make.centerY.equalToSuperview()
			make.left.equalToSuperview().offset(16)
		}

		label.textColor = .white
		addSubview(label)
		label.snp.makeConstraints { make in
			make.centerY.equalToSuperview()
			make.left.equalTo(image.snp.right).offset(16)
		}
	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}
