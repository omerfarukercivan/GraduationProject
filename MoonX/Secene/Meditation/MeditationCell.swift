//
//  MeditationCell.swift
//  MoonX
//
//  Created by Ömer Faruk Ercivan on 31.08.2023.
//

import UIKit
import NeonSDK

class MeditationCell: NeonCollectionViewCell<MusicModel> {

	private let image = UIImageView()
	private let view = UIView()
	private let blurView = NeonBlurView()
	private let nameLabel = UILabel()
	private let artistLabel = UILabel()
	private let durationLabel = UILabel()
	private let playButton = UIButton()

	override init(frame: CGRect) {
		super.init(frame: frame)
		setupSubviews()
	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	override func configure(with music: MusicModel) {
		super.configure(with: music)

		blurView.colorTint = .black
		blurView.colorTintAlpha = 0.1
		blurView.blurRadius = 10
		blurView.scale = 1

		image.image = UIImage(named: music.image)

		nameLabel.text = music.musicName
		nameLabel.font = Font.custom(size: 16, fontWeight: .Regular)
		nameLabel.textColor = .white

		artistLabel.text = music.artistName
		artistLabel.textColor = .white
		artistLabel.font = Font.custom(size: 10, fontWeight: .Regular)

		durationLabel.text = music.duration
		durationLabel.textColor = .white
		durationLabel.font = Font.custom(size: 10, fontWeight: .Regular)

		playButton.setImage(UIImage(named: "btn_play"), for: .normal)
	}

	private func setupSubviews() {
		contentView.addSubview(image)
		image.snp.makeConstraints { make in
			make.edges.equalToSuperview()
		}

		contentView.addSubview(blurView)
		blurView.snp.makeConstraints { make in
			make.bottom.left.right.equalToSuperview()
			make.top.equalTo(contentView.snp.centerY).offset(40)
		}

		contentView.addSubview(view)
		view.snp.makeConstraints { make in
			make.bottom.left.right.equalToSuperview()
			make.top.equalTo(contentView.snp.centerY).offset(40)
		}

		view.addSubview(nameLabel)
		nameLabel.snp.makeConstraints { make in
			make.top.equalToSuperview().offset(4)
			make.left.equalToSuperview().offset(8)
		}

		view.addSubview(artistLabel)
		artistLabel.snp.makeConstraints { make in
			make.top.equalTo(nameLabel.snp.bottom).offset(2)
			make.left.equalToSuperview().offset(8)
		}

		view.addSubview(durationLabel)
		durationLabel.snp.makeConstraints { make in
			make.top.equalTo(artistLabel.snp.top)
			make.left.equalTo(artistLabel.snp.right).offset(16)
			make.centerY.equalTo(artistLabel.snp.centerY)
		}

		view.addSubview(playButton)
		playButton.snp.makeConstraints { make in
			make.right.equalToSuperview().offset(-4)
		}
	}
}
