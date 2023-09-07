//
//  CustomInAppButton.swift
//  MoonX
//
//  Created by Ömer Faruk Ercivan on 7.09.2023.
//

import UIKit
import NeonSDK

final class CustomInAppButton: UIButton {

	let image = UIImageView()
	let label = UILabel()
	let label2 = UILabel()

	override init(frame: CGRect) {
		super.init(frame: frame)

		layer.backgroundColor = UIColor.mainBlack.cgColor
		layer.borderColor = UIColor.mainBlack.cgColor
		layer.borderWidth = 1
		layer.cornerRadius = 16

		addSubview(self.image)
		self.image.snp.makeConstraints { make in
			make.left.equalTo(snp.left).offset(8)
			make.width.equalTo(20)
			make.centerY.equalToSuperview()
		}

		label.textColor = .white
		addSubview(label)
		label.snp.makeConstraints { make in
			make.left.equalTo(image.snp.right).offset(16)
			make.centerY.equalToSuperview()
		}

		label2.textColor = .white
		label2.font = Font.custom(size: 22, fontWeight: .Medium)
		addSubview(label2)
		label2.snp.makeConstraints { make in
			make.left.equalTo(snp.right).inset(80)
			make.centerY.equalToSuperview()
		}
	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}
