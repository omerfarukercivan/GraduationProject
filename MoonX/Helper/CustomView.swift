//
//  CustomView.swift
//  MoonX
//
//  Created by Ömer Faruk Ercivan on 7.09.2023.
//

import UIKit
import NeonSDK

final class CustomView: UIView {

	let image = UIImageView()
	let label = UILabel()

	override init(frame: CGRect) {
		super.init(frame: frame)

		layer.backgroundColor = UIColor.mainBlack2.cgColor
		layer.cornerRadius = 10

		addSubview(self.image)
		self.image.snp.makeConstraints { make in
			make.left.equalToSuperview().offset(2)
			make.height.equalToSuperview().multipliedBy(0.5)
			make.width.equalTo(image.snp.height)
			make.centerY.equalToSuperview()
		}

		label.textColor = .white
		addSubview(label)
		label.snp.makeConstraints { make in
			make.left.equalTo(image.snp.right).offset(2)
			make.centerY.equalToSuperview()
		}
	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}
